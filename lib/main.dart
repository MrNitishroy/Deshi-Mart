import 'package:deshi_mart/configs/Themes.dart';
import 'package:deshi_mart/pages/HomePage/HomePage.dart';
import 'package:deshi_mart/providers/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => DrawerProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deshi Mart',
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
