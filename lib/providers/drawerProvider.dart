import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  int selectedPageIndex = 0;

  void seletedMenu(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }
}
