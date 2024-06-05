import 'package:deshi_mart/configs/Themes.dart';
import 'package:deshi_mart/pages/Web/HomePage.dart';
import 'package:deshi_mart/views/AuthView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deshi Mart',
      theme: lightTheme,
      home: AuthView(),
    );
  }
}
