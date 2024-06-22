import 'package:deshi_mart/configs/CustomNotication.dart';
import 'package:deshi_mart/models/SubCategory.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  TextEditingController categoryName = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  final uuid = Uuid();

  List<SubCategory> subCategories = [];

  Future<void> addCategory(BuildContext context) async {
    if (subCategories.isNotEmpty) {
      Category newCategory = Category(
        id: uuid.v4(),
        title: categoryName.text,
        value: categoryName.text.toLowerCase().replaceAll(' ', '-'),
        subCategories: subCategories,
      );
      print(newCategory.title);
      print(newCategory.subCategories);
      successMessage(context, "Category added successfully");
    } else {
      errorMessage(context, "Please add at least one sub category");
    }
  }

  void addSubCategory(String subCategoryName) {
    if (subCategoryName.isNotEmpty) {
      subCategories.add(SubCategory(
        id: uuid.v4(),
        title: subCategoryName,
        value: subCategoryName.toLowerCase().replaceAll(' ', '-'),
      ));
    }
    subCategory.clear();
    notifyListeners();
  }

  void removeSubCategory(String id) {
    subCategories.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
