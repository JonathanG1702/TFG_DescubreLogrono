import '/backend/supabase/supabase.dart';

Future<User?> emailSignInFunc(
  String email,
  String password,
) async {
  final AuthResponse res = await SupaFlow.client.auth
      .signInWithPassword(email: email, password: password);
  return res.user;
}

Future<User?> emailCreateAccountFunc(
  String email,
  String password,
) async {
  final AuthResponse res =
      await SupaFlow.client.auth.signUp(email: email, password: password);

  // Si el proyecto de Supabase está configurado para no permitir que los usuarios inicien sesión hasta que
  // el correo electrónico haya sido confirmado, el usuario devuelto en AuthResponse aún tiene
  // toda la información del usuario. Pero dado que el usuario no debería poder iniciar sesión sin
  // tener su correo electrónico verificado, devuelve un Usuario nulo.
  return res.user?.lastSignInAt == null ? null : res.user;
}
