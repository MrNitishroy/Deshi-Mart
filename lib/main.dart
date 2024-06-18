import 'package:deshi_mart/configs/PageRoutes.dart';
import 'package:deshi_mart/configs/Themes.dart';
import 'package:deshi_mart/providers/DrawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/AddProductProvider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DrawerProvider()),
      ChangeNotifierProvider(create: (_) => AddProductProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Deshi Mart',
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
