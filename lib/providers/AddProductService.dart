import 'package:deshi_mart/providers/ImagePicker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProductService extends ChangeNotifier {
  // final imagePickerSerivce = Provider.of<ImagePickerService>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  String selectedCategory = "";
  String selectedSubCategory = "";
  String selectedUnitType = "";
  String selectedUnit = "";
  TextEditingController stockController = TextEditingController();
  bool isActive = false;
  List<String> tags = [];
  List<String> images = [];

  void addProduct() {
    print("Product Name : ${productNameController.text}");
    print("Description : ${descriptionController.text}");
    print("Sell Price : ${sellPriceController.text}");
    print("Purchase Price : ${purchasePriceController.text}");
    print("Discount Price : ${discountPriceController.text}");
    print("Stock : ${stockController.text}");
    print("Tags : $tags");
    print("Category : $selectedCategory");
    print("Sub Category : $selectedSubCategory");
    print("Unit Type : $selectedUnitType");
    print("Unit : $selectedUnit");
    print("Is Active : $isActive");
    print("Images : $images");
  }
}
