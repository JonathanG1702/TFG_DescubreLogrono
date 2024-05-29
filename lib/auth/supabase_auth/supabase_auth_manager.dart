import 'dart:async';

import 'package:flutter/material.dart';
import '/auth/auth_manager.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_assets/flutter_flow_util.dart';
import 'email_auth.dart';

import 'supabase_user_provider.dart';

export '/auth/base_auth_user_provider.dart';

class SupabaseAuthManager extends AuthManager with EmailSignInManager {
  @override
  Future signOut() {
    return SupaFlow.client.auth.signOut();
  }

  @override
  Future deleteUser(BuildContext context) async {
    try {
      if (!loggedIn) {
        print('Error: el intento de borrar un usuario no es posible si no has iniciado sesion como dicho usuario!');
        return;
      }
      await currentUser?.delete();
    } on AuthException {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(FFLocalizations.of(context).getText(
          'j2434xxs' /* Se ha producido un error con l... */,
        ))),
      );
    }
  }

  @override
  Future updateEmail({
    required String email,
    required BuildContext context,
  }) async {
    try {
      if (!loggedIn) {
        print('Error: el intento de actualizar el correo no es posible si no has iniciado sesion con dicho usuario!');
        return;
      }
      await currentUser?.updateEmail(email);
    } on AuthException {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(FFLocalizations.of(context).getText(
          'j2434xxs' /* Se ha producido un error con l... */,
        ))),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ESe ha enviado un email para confirmar el cambio de la direccion de correo')),
    );
  }

  @override
  Future resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await SupaFlow.client.auth.resetPasswordForEmail(email);
    } on AuthException {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(FFLocalizations.of(context).getText(
          'j2434xxs' /* Se ha producido un error con l... */,
        ))),
      );
      return null;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Se ha enviado un email para restablecer la contraseña.')),
    );
  }

  @override
  Future<BaseAuthUser?> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        context,
        () => emailSignInFunc(email, password),
      );

  @override
  Future<BaseAuthUser?> createAccountWithEmail(
    BuildContext context,
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        context,
        () => emailCreateAccountFunc(email, password),
      );

  /// Intenta iniciar sesion o crear una cuenta usando Firebase Auth.
  /// Devuelve el objeto Usuario si el inicio de sesión fue exitoso.
  Future<BaseAuthUser?> _signInOrCreateAccount(
    BuildContext context,
    Future<User?> Function() signInFunc,
  ) async {
    try {
      final user = await signInFunc();
      final authUser = user == null ? null : DescubreLogronoSupabaseUser(user);

      // Actualiza currentUser aquí en caso de que la información del usuario necesite ser utilizada
      // inmediatamente después de que un usuario inicie sesión. Esto debería ser manejado por el flujo de usuario,
      // pero también se agrega aquí en caso de una condición de carrera donde el flujo de usuario
      // no asigne currentUser a tiempo.
      if (authUser != null) {
        currentUser = authUser;
        AppStateNotifier.instance.update(authUser);
      }
      return authUser;
    } on AuthException catch (e) {
      final errorMsg = e.message.contains('El usuario ya se encuentra registrado') ?? false
          ? FFLocalizations.of(context).getText(
              '35hu7r35' /* El correo introducido ya perte... */,
            )
          : FFLocalizations.of(context).getText(
              'j2434xxs' /* Se ha producido un error con l... */,
            );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
      return null;
    }
  }
}
