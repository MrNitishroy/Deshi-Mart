import 'package:deshi_mart/pages/Category/AddCategory.dart';
import 'package:deshi_mart/pages/HomePage/HomePage.dart';
import 'package:deshi_mart/pages/Product/AddProduct.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/addProduct',
      builder: (BuildContext context, GoRouterState state) {
        return const AddProduct();
      },
    ),
    GoRoute(
      path: '/addCategory',
      builder: (BuildContext context, GoRouterState state) {
        return const AddCategory();
      },
    ),
  ],
);
