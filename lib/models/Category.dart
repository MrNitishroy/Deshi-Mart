import 'package:deshi_mart/models/SubCategory.dart';

class Category {
  String? id;
  String? title;
  String? value;
  List<SubCategory>? subCategories;
  String? coverUrl;

  Category(
      {this.id, this.title, this.value, this.subCategories, this.coverUrl});

  Category.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
    if (json["coverUrl"] is String) {
      value = json["coverUrl"];
    }
    if (json["subCategories"] is List) {
      subCategories = List.from(json["subCategories"])
          .map((x) => SubCategory.fromJson(x))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["value"] = value;
    _data["coverUrl"] = coverUrl;
    _data["subCategories"] = subCategories?.map((x) => x.toJson()).toList();
    return _data;
  }
}
