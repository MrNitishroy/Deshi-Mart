import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/configs/Colors.dart';
import 'package:deshi_mart/models/menuModel.dart';
import 'package:deshi_mart/providers/drawerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../widgets/DrawerMenu.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
              child: Consumer<DrawerProvider>(builder: (context, value, child) {
            return Column(
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
            );
          })),
          Expanded(
            flex: 6,
            child: Container(
              color: darkSecondryColor,
            ),
          ),
        ],
      )),
    );
  }
}
