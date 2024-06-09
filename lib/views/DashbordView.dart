import 'package:deshi_mart/pages/Mobile/Dashboard/Dashboard.dart';
import 'package:deshi_mart/pages/Web/Dashboard/Dashboard.dart';
import 'package:deshi_mart/widgets/ResponsiveLayout.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: Dashboard(),
      desktop: WebDashBoard(),
    );
  }
}
