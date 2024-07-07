import 'package:deshi_mart/models/SubCategory.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../configs/Notification.dart';
import '../models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    getAllCatgories();
  }

  TextEditingController categoryName = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  final uuid = Uuid();

  List<SubCategory> subCategories = [];
  bool isLoading = false;
  List<Category> categories = [];

  Future<void> getAllCatgories() async {
    isLoading = true;
    notifyListeners();
    categories.clear();
    try {
    
    } catch (ex) {
      print("error while geting data");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addCategoriesBulk() async {
    for (var category in categories) {
   
      print("Categry ${category.id} added");
    }
    print("Data added");
  }

  // Add Category to database
  Future<void> addCategory(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    if (subCategories.isNotEmpty && categoryName.text.isNotEmpty) {
      String id = uuid.v4();
      Category newCategory = Category(
        id: id,
        title: categoryName.text,
        value: categoryName.text.toLowerCase().replaceAll(' ', '-'),
        subCategories: subCategories,
      );

      try {
   
        successMessage(context, "Category added successfully");
      } catch (ex) {
        errorMessage(context, ex.toString());
      }
    } else {
      errorMessage(context, "Please add at least one sub category");
    }
    isLoading = false;
    notifyListeners();
  }

  //! Add Sub Category
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

//* Remove Sub Categry
  void removeSubCategory(String id) {
    subCategories.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
