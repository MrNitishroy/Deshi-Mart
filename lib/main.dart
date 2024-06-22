import 'package:deshi_mart/configs/PageRoutes.dart';
import 'package:deshi_mart/configs/Themes.dart';
import 'package:deshi_mart/firebase_options.dart';
import 'package:deshi_mart/providers/DrawerProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'providers/AddProductProvider.dart';
import 'providers/CategoryProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DrawerProvider()),
      ChangeNotifierProvider(create: (_) => AddProductProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
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
      builder: (context, child) {
        return ToastificationConfigProvider(
          config: const ToastificationConfig(
            alignment: Alignment.center,
            itemWidth: 440,
            animationDuration: Duration(milliseconds: 500),
          ),
          child: child!,
        );
      },
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
