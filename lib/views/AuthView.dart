import 'package:deshi_mart/pages/Mobile/Auth/Auth.dart';
import 'package:deshi_mart/pages/Web/Auth/Auth.dart';
import 'package:deshi_mart/widgets/ResponsiveLayout.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: AuthPage(),
      desktop: WebAuthPage(),
    );
  }
}
