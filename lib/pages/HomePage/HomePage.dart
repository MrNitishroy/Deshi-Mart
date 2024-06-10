import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/pages/Dashboard/Dashboard.dart';
import 'package:deshi_mart/providers/drawerProvider.dart';
import 'package:deshi_mart/widgets/AppBar.dart';
import 'package:deshi_mart/widgets/MyDrawer.dart';
import 'package:deshi_mart/widgets/ResponsiveLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../widgets/DrawerMenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      drawer: isDesktop ? null : MyDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop) Expanded(child: MyDrawer()),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  MyAppBar(),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Consumer<DrawerProvider>(
                      builder: (context, value, child) =>
                          value.pages[value.selectedPageIndex],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
