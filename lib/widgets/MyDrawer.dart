import 'package:deshi_mart/configs/AssetsPath.dart';
import 'package:deshi_mart/providers/ThemeProvider.dart';
import 'package:deshi_mart/widgets/DrawerMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../providers/DrawerProvider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    // final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Consumer<DrawerProvider>(builder: (context, value, child) {
      return Drawer(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                // height: 60,
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(IconsAssets.appIcon),
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search. . .",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
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
                      icon: IconsAssets.box,
                      onPress: () {
                        drawerProvider.seletedMenu(2);
                      },
                      isSeleted: drawerProvider.selectedPageIndex == 2,
                    ),
                    MyDrawerMenu(
                      title: "Coupon",
                      icon: IconsAssets.coupon,
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
              ),
              Consumer<ThemeProvider>(
                builder: (context, value, _) => Container(
                  padding: EdgeInsets.all(5),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          print("Light");
                          value.changeTheme(ThemeMode.light);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: value.themeMode == ThemeMode.light
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                : Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    IconsAssets.sun,
                                    width: 15,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "LIGHT",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          value.changeTheme(ThemeMode.dark);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: value.themeMode == ThemeMode.dark
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                : Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    IconsAssets.moon,
                                    width: 15,
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "DARK",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
