import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/widgets/DrawerMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/drawerProvider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    return Consumer<DrawerProvider>(builder: (context, value, child) {
      return Drawer(
        width: 200,
        child: SingleChildScrollView(
            child: Column(
          children: [
            DrawerHeader(
              child: SvgPicture.asset(
                IconsAssets.appIcon,
              ),
            ),
            MyDrawerMenu(
              title: "Dashboard",
              icon: IconsAssets.dashboard,
              onPress: () {
                drawerProvider.seletedMenu(0);
              },
              isSeleted: drawerProvider.selectedPageIndex == 0,
            ),
            MyDrawerMenu(
              title: "Product",
              icon: IconsAssets.bag,
              onPress: () {
                drawerProvider.seletedMenu(1);
              },
              isSeleted: drawerProvider.selectedPageIndex == 1,
            ),
            MyDrawerMenu(
              title: "Category",
              icon: IconsAssets.shop,
              onPress: () {
                drawerProvider.seletedMenu(2);
              },
              isSeleted: drawerProvider.selectedPageIndex == 2,
            ),
            MyDrawerMenu(
              title: "Coupone",
              icon: IconsAssets.done,
              onPress: () {
                drawerProvider.seletedMenu(3);
              },
              isSeleted: drawerProvider.selectedPageIndex == 3,
            ),
            MyDrawerMenu(
              title: "Settings",
              icon: IconsAssets.setting,
              onPress: () {
                drawerProvider.seletedMenu(4);
              },
              isSeleted: drawerProvider.selectedPageIndex == 4,
            ),
          ],
        )),
      );
    });
  }
}
