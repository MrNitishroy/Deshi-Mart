import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart/configs/CustomNotication.dart';
import 'package:deshi_mart/models/SubCategory.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  TextEditingController categoryName = TextEditingController();
  TextEditingController subCategory = TextEditingController();
  final uuid = Uuid();
  final db = FirebaseFirestore.instance;
  List<SubCategory> subCategories = [];
  bool isLoading = false;

  List<Category> categories = [
    Category(
        id: "1",
        title: "Mobile Phone",
        value: "mobile_phone",
        subCategories: [
          SubCategory(id: "1.1", title: "Smart Phone", value: "smart_phone"),
        ]),
  ];
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
        await db.collection("Categories").doc(id).set(
              newCategory.toJson(),
            );
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
