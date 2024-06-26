import 'package:deshi_mart/pages/Category/CategoryPage.dart';
import 'package:deshi_mart/pages/Coupon/CouponPage.dart';
import 'package:deshi_mart/pages/Dashboard/Dashboard.dart';
import 'package:deshi_mart/pages/Product/ProductPage.dart';
import 'package:deshi_mart/pages/Settings/SettingsPage.dart';
import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  int selectedPageIndex = 1;
  var pages = [
    DashBoard(),
    ProductPage(),
    CategoryPage(),
    CouponPage(),
    SettingsPage(),
  ];
  void seletedMenu(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }
}
