import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart/models/Product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';

class AddProductProvider extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  List<Uint8List> images = [];
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController purchasePrice = TextEditingController();
  TextEditingController sellPrice = TextEditingController();
  TextEditingController discountPrice = TextEditingController();
  TextEditingController stock = TextEditingController();
  TextEditingController tags = TextEditingController();
  final db = FirebaseStorage.instance;
  final database = FirebaseFirestore.instance;
  final uuid = Uuid();
  String selectedCategory = "";
  String selectedSubCategory = "";
  String selectedUnitType = "";
  String selectedUnit = "";
  bool isLoading = false;
  void printProductsDetails() {
    print("Product Name : ${name.text}");
    print("Description : ${description.text}");
    print("Sell Price : ${sellPrice.text}");
    print("Purchase Price : ${purchasePrice.text}");
    print("Discount Price : ${discountPrice.text}");
    print("Stock : ${stock.text}");
    print("Tags : $tags");
    print("Category : $selectedCategory");
    print("Sub Category : $selectedSubCategory");
    print("Unit Type : $selectedUnitType");
    print("Unit : $selectedUnit");
    print("Images : $images");
  }

  Future<void> addProduct(BuildContext context) async {
    if (!_validateInputs(context)) return;

    isLoading = true;
    notifyListeners();

    try {
      String id = uuid.v4();
      List<String> urls = await uploadImages(images, "product");
      Product newProduct = Product(
        id: id,
        name: name.text,
        description: description.text,
        sellPrice: double.parse(sellPrice.text),
        purchasePrice: double.parse(purchasePrice.text),
        images: urls,
        category: selectedCategory,
        subCategory: selectedSubCategory,
        unitType: selectedUnitType,
        unit: selectedUnit,
        discount: double.parse(discountPrice.text),
        stock: double.parse(stock.text),
        averageRating: 0,
      );
      await database.collection("products").doc(id).set(newProduct.toJson());
      print("Product added successfully");
      clearAllField();
    } catch (e) {
      print("Failed to add product: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add product: $e')),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearAllField() {
    name.clear();
    description.clear();
    purchasePrice.clear();
    sellPrice.clear();
    stock.clear();
    tags.clear();
    images.clear();
    selectedCategory = "";
    selectedSubCategory = "";
    selectedUnitType = "";
    selectedUnit = "";
    notifyListeners();
  }

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

  void addImage(Uint8List imageData) {
    if (images.length < 6) {
      images.add(imageData);
      print(images);
      notifyListeners();
    }
  }

  void removeImage(Uint8List imageData) {
    images.remove(imageData);
    notifyListeners();
  }

  Future<void> pickImage() async {
    if (images.length < 6) {
      var response = await picker.pickImage(source: ImageSource.gallery);
      if (response != null) {
        var imageData = await response.readAsBytes();
        addImage(imageData);
      }
    }
  }

  bool _validateInputs(BuildContext context) {
    if (name.text.isEmpty) {
      _showError(context, "Name is required.");
      return false;
    }
    if (images.isEmpty) {
      _showError(context, "At least one image is required.");
      return false;
    }
    if (sellPrice.text.isEmpty || double.tryParse(sellPrice.text) == null) {
      _showError(context, "Valid sell price is required.");
      return false;
    }
    if (purchasePrice.text.isEmpty ||
        double.tryParse(purchasePrice.text) == null) {
      _showError(context, "Valid purchase price is required.");
      return false;
    }
    if (selectedCategory == null) {
      _showError(context, "Category is required.");
      return false;
    }
    if (selectedSubCategory == null) {
      _showError(context, "Sub-category is required.");
      return false;
    }
    if (selectedUnitType == null) {
      _showError(context, "Unit type is required.");
      return false;
    }
    if (selectedUnit == null) {
      _showError(context, "Unit is required.");
      return false;
    }
    if (discountPrice.text.isEmpty ||
        double.tryParse(discountPrice.text) == null) {
      _showError(context, "Valid discount price is required.");
      return false;
    }
    if (stock.text.isEmpty || double.tryParse(stock.text) == null) {
      _showError(context, "Valid stock is required.");
      return false;
    }
    return true;
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
