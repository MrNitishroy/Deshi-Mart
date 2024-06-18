import 'package:deshi_mart/pages/HomePage/HomePage.dart';
import 'package:deshi_mart/pages/Product/AddProduct.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/z',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AddProduct();
      },
    ),
  ],
);
