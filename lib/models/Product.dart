import 'package:deshi_mart/models/Review.dart';

class Product {
  String? id;
  String? name;
  String? description;
  double? stock;
  double? sellPrice;
  double? purchasePrice;
  String? unit;
  double? unitPrice;
  List<String>? tags;
  String? category;
  List<String>? images;
  String? createAt;
  String? updatedAt;
  bool? isActive;
  List<Review>? reviews;
  double? discount;
  String? discountStartDate;
  String? discountEndData;
  String? supplier;
  double? averageRating;

  Product(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.sellPrice,
      this.purchasePrice,
      this.unit,
      this.unitPrice,
      this.tags,
      this.category,
      this.images,
      this.createAt,
      this.updatedAt,
      this.isActive,
      this.reviews,
      this.discount,
      this.discountStartDate,
      this.discountEndData,
      this.supplier,
      this.averageRating});

  Product.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["stock"] is double) {
      stock = json["stock"];
    }
    if (json["sellPrice"] is double) {
      sellPrice = json["sellPrice"];
    }
    if (json["purchasePrice"] is double) {
      purchasePrice = json["purchasePrice"];
    }
    if (json["unit"] is String) {
      unit = json["unit"];
    }
    if (json["unitPrice"] is double) {
      unitPrice = json["unitPrice"];
    }
    if (json["tags"] is List) {
      tags = json["tags"] ?? [];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["images"] is List) {
      images = json["images"] ?? [];
    }
    if (json["createAt"] is String) {
      createAt = json["createAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["isActive"] is bool) {
      isActive = json["isActive"];
    }
    if (json["reviews"] is List) {
      reviews = json["reviews"] ?? [];
    }
    if (json["discount"] is double) {
      discount = json["discount"];
    }
    if (json["discountStartDate"] is String) {
      discountStartDate = json["discountStartDate"];
    }
    if (json["discountEndData"] is String) {
      discountEndData = json["discountEndData"];
    }
    if (json["supplier"] is String) {
      supplier = json["supplier"];
    }
    if (json["averageRating"] is double) {
      averageRating = json["averageRating"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["stock"] = stock;
    _data["sellPrice"] = sellPrice;
    _data["purchasePrice"] = purchasePrice;
    _data["unit"] = unit;
    _data["unitPrice"] = unitPrice;
    if (tags != null) {
      _data["tags"] = tags;
    }
    _data["category"] = category;
    if (images != null) {
      _data["images"] = images;
    }
    _data["createAt"] = createAt;
    _data["updatedAt"] = updatedAt;
    _data["isActive"] = isActive;
    if (reviews != null) {
      _data["reviews"] = reviews;
    }
    _data["discount"] = discount;
    _data["discountStartDate"] = discountStartDate;
    _data["discountEndData"] = discountEndData;
    _data["supplier"] = supplier;
    _data["averageRating"] = averageRating;
    return _data;
  }
}




// {
//   "id":"",
//   "name":"",
//   "description":"",
//   "stock":2.3,
//   "sellPrice":2.3,
//   "purchasePrice":2.3,
//   "unit":"",
//   "unitPrice":1.2,
//   "tags":[],
//   "category":"",
//   "images":[],
//   "createAt":"",
//   "updatedAt":"",
//   "isActive":false,
//   "reviews":[],
//   "discount":2.3,
//   "discountStartDate":"",
//   "discountEndData":"",
//   "supplier":"",
//   "averageRating":2.4

// }