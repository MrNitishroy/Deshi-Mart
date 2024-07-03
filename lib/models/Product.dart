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
  String? subCategory;
  String? unitType;
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

  Product({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.sellPrice,
    this.purchasePrice,
    this.unit,
    this.unitPrice,
    this.tags,
    this.category,
    this.subCategory,
    this.unitType,
    this.images,
    this.createAt,
    this.updatedAt,
    this.isActive,
    this.reviews,
    this.discount,
    this.discountStartDate,
    this.discountEndData,
    this.supplier,
    this.averageRating,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"] as String?;
    name = json["name"] as String?;
    description = json["description"] as String?;
    stock = (json["stock"] as num?)?.toDouble();
    sellPrice = (json["sellPrice"] as num?)?.toDouble();
    purchasePrice = (json["purchasePrice"] as num?)?.toDouble();
    unit = json["unit"] as String?;
    unitPrice = (json["unitPrice"] as num?)?.toDouble();
    tags = (json["tags"] as List<dynamic>?)?.map((e) => e as String).toList();
    category = json["category"] as String?;
    subCategory = json["subCategory"] as String?;
    unitType = json["unitType"] as String?;
    images =
        (json["images"] as List<dynamic>?)?.map((e) => e as String).toList();
    createAt = json["createAt"] as String?;
    updatedAt = json["updatedAt"] as String?;
    isActive = json["isActive"] as bool?;
    reviews = (json["reviews"] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList();
    discount = (json["discount"] as num?)?.toDouble();
    discountStartDate = json["discountStartDate"] as String?;
    discountEndData = json["discountEndData"] as String?;
    supplier = json["supplier"] as String?;
    averageRating = (json["averageRating"] as num?)?.toDouble();
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
    _data["tags"] = tags;
    _data["category"] = category;
    _data["subCategory"] = subCategory;
    _data["unitType"] = unitType;
    _data["images"] = images;
    _data["createAt"] = createAt;
    _data["updatedAt"] = updatedAt;
    _data["isActive"] = isActive;
    if (reviews != null) {
      _data["reviews"] = reviews!.map((e) => e.toJson()).toList();
    }
    _data["discount"] = discount;
    _data["discountStartDate"] = discountStartDate;
    _data["discountEndData"] = discountEndData;
    _data["supplier"] = supplier;
    _data["averageRating"] = averageRating;
    return _data;
  }
}
