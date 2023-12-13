import 'package:code_demonstration/features/configuration/auth/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';

/// Material роут для [LoginScreen]
class AuthScreenMaterialRoute extends MaterialPageRoute {
  AuthScreenMaterialRoute()
      : super(
          builder: (ctx) => const AuthScreen(),
        );
}
