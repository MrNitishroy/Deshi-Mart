import 'package:deshi_mart/pages/Mobile/HomePage/HomePage.dart';
import 'package:deshi_mart/pages/Web/HomePage/HomePage.dart';
import 'package:deshi_mart/widgets/ResponsiveLayout.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: HomePage(),
      desktop: WebHomePage(),
    );
  }
}
