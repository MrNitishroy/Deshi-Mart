import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:deshi_mart/models/Product.dart';
import 'package:deshi_mart/providers/ImagePicker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class AddProductService extends ChangeNotifier {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController purchasePriceController = TextEditingController();
  TextEditingController discountPriceController = TextEditingController();
  String selectedCategory = "";
  String selectedSubCategory = "";
  String selectedUnitType = "";
  String selectedUnit = "";
  final db = FirebaseStorage.instance;
  final uuid = Uuid();
  TextEditingController stockController = TextEditingController();
  bool isActive = true;
  List<String> tags = [];
  List<Uint8List> images = [];
  bool isLoading = false;

  Future<void> addProduct() async {
    try {
      String id = uuid.v4();
      isLoading = true;
      notifyListeners();
      List<String> imageUrls = await uploadImages(images, id);
      var product = Product(
        id: id,
        name: productNameController.text,
        description: descriptionController.text,
        sellPrice: double.parse(sellPriceController.text),
        purchasePrice: double.parse(purchasePriceController.text),
        stock: double.parse(stockController.text),
        tags: tags,
        images: imageUrls,
        isActive: isActive,
        category: selectedCategory,
        averageRating: 0.0,
        discount: double.parse(discountPriceController.text),
        subCategory: selectedSubCategory,
        unit: selectedUnit,
        createAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        supplier: "Nitish kumar",
      );
      var response = await http.post(
        Uri.parse("https://localhost:7093/api/Product"),
        body: jsonEncode(product),
      );
      print(response.body);
      isLoading = false;
      notifyListeners();
    } catch (ex) {
      print(ex);
      isLoading = false;
      notifyListeners();
    }
  }

  void showProductDetails() async {}

  Future<List<String>> uploadImages(
      List<Uint8List> images, String forlderName) async {
    List<String> imageUrls = [];
    for (var image in images) {
      String imageId = "${uuid.v4()}.jpg";
      var imageRef = db.ref(forlderName);
      try {
        await imageRef.child(imageId).putData(image);
        String downloadUrl = await imageRef.child(imageId).getDownloadURL();
        imageUrls.add(downloadUrl);
        print("Image uploaded successfully: $downloadUrl");
      } catch (e) {
        print("Failed to upload image: $e");
      }
    }
    return imageUrls;
  }
}
