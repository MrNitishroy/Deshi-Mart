class SubCategory {
  String? id;
  String? title;
  String? value;

  SubCategory({this.id, this.title, this.value});

  SubCategory.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["value"] is String) {
      value = json["value"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["value"] = value;
    return _data;
  }
}
