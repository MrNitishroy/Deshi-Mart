class Review {
  String? reviewerName;
  int? rating;
  String? comment;
  String? reviewDate;

  Review({this.reviewerName, this.rating, this.comment, this.reviewDate});

  Review.fromJson(Map<String, dynamic> json) {
    if (json["reviewerName"] is String) {
      reviewerName = json["reviewerName"];
    }
    if (json["rating"] is int) {
      rating = json["rating"];
    }
    if (json["comment"] is String) {
      comment = json["comment"];
    }
    if (json["reviewDate"] is String) {
      reviewDate = json["reviewDate"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["reviewerName"] = reviewerName;
    _data["rating"] = rating;
    _data["comment"] = comment;
    _data["reviewDate"] = reviewDate;
    return _data;
  }
}

// {
//   "reviewerName": "",
//   "rating": 0,
//   "comment": "",
//   "reviewDate": ""
// }