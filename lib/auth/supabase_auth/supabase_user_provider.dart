import 'package:rxdart/rxdart.dart';

import '/backend/supabase/supabase.dart';
import '../base_auth_user_provider.dart';

export '../base_auth_user_provider.dart';

class DescubreLogronoSupabaseUser extends BaseAuthUser {
  DescubreLogronoSupabaseUser(this.user);
  User? user;
  @override
  bool get loggedIn => user != null;

  @override
  AuthUserInfo get authUserInfo => AuthUserInfo(
        uid: user?.id,
        email: user?.email,
        phoneNumber: user?.phone,
      );

  @override
  Future? delete() =>
      throw UnsupportedError('La operacion para eliminar usuarios aun no es compatible.');

  @override
  Future? updateEmail(String email) async {
    final response =
        await SupaFlow.client.auth.updateUser(UserAttributes(email: email));
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? sendEmailVerification() => throw UnsupportedError(
      'El envio de correo electrónico para verificacion aun no es compatible.');

  @override
  bool get emailVerified {
    if (loggedIn && user!.emailConfirmedAt == null) {
      refreshUser();
    }
    return user?.emailConfirmedAt != null;
  }

  @override
  Future refreshUser() async {
    await SupaFlow.client.auth
        .refreshSession()
        .then((_) => user = SupaFlow.client.auth.currentUser);
  }
}

/// Produce un flujo del usuario autenticado.
/// [SupaFlow.client.auth.onAuthStateChange] no produce ningun valor hasta que
/// el usuario ya este autenticado. Por lo tanto, agregamos un usuario nulo
/// predeterminado al flujo.
/// Si necesitamos interactuar con el [currentUser] antes de iniciar sesion.
Stream<BaseAuthUser> descubreLogronoSupabaseUserStream() {
  final supabaseAuthStream = SupaFlow.client.auth.onAuthStateChange.debounce(
      (authState) => authState.event == AuthChangeEvent.tokenRefreshed
          ? TimerStream(authState, const Duration(seconds: 1))
          : Stream.value(authState));
  return (!loggedIn
          ? Stream<AuthState?>.value(null).concatWith([supabaseAuthStream])
          : supabaseAuthStream)
      .map<BaseAuthUser>(
    (authState) {
      currentUser = DescubreLogronoSupabaseUser(authState?.session?.user);
      return currentUser!;
    },
  );
}
