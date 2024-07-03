import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshi_mart/models/Product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';

import '../configs/CustomNotication.dart';

class AddProductProvider extends ChangeNotifier {
  AddProductProvider() {
    getProducts();
  }

  final ImagePicker picker = ImagePicker();
  List<Uint8List> images = [];
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController purchasePrice = TextEditingController(text: "0");
  TextEditingController sellPrice = TextEditingController();
  TextEditingController discountPrice = TextEditingController(text: "0");
  TextEditingController stock = TextEditingController(text: "0");
  TextEditingController tags = TextEditingController();
  final db = FirebaseStorage.instance;
  final database = FirebaseFirestore.instance;
  final uuid = Uuid();
  List<Product> products = [];
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

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await database.collection("products").get();
      products = response.docs.map((e) => Product.fromJson(e.data())).toList();
      print(products[0]);
    } catch (ex) {
      print(ex.toString());
    }
    isLoading = false;
    notifyListeners();
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
        createAt: DateTime.now().toString(),
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
        discountEndData: "",
        discountStartDate: "",
        isActive: true,
        reviews: [],
        supplier: "",
        tags: [],
        unitPrice: 0,
        updatedAt: DateTime.now().toString(),
      );
      await database.collection("products").doc(id).set(newProduct.toJson());
      successMessage(context, "Product added");
      clearAllField();
    } catch (e) {
      errorMessage(context, "Failed to add product");
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
      errorMessage(context, "Name is required.");
      return false;
    }
    if (images.isEmpty) {
      errorMessage(context, "At least one image is required.");
      return false;
    }
    if (sellPrice.text.isEmpty || double.tryParse(sellPrice.text) == null) {
      errorMessage(context, "Valid sell price is required.");
      return false;
    }
    if (purchasePrice.text.isEmpty ||
        double.tryParse(purchasePrice.text) == null) {
      errorMessage(context, "Valid purchase price is required.");
      return false;
    }
    if (selectedCategory == "") {
      errorMessage(context, "Category is required.");
      return false;
    }
    if (selectedSubCategory == "") {
      errorMessage(context, "Sub-category is required.");
      return false;
    }
    if (selectedUnitType == "") {
      errorMessage(context, "Unit type is required.");
      return false;
    }
    if (selectedUnit == "") {
      errorMessage(context, "Unit is required.");
      return false;
    }
    if (discountPrice.text.isEmpty ||
        double.tryParse(discountPrice.text) == null) {
      errorMessage(context, "Valid discount price is required.");
      return false;
    }
    if (stock.text.isEmpty || double.tryParse(stock.text) == null) {
      errorMessage(context, "Valid stock is required.");
      return false;
    }
    return true;
  }
}
