import 'dart:convert';

class NannyReviewsModel {
  int? averageRating;
  int? totalReviews;
  Map<String, int>? starCounts;
  List<Review2>? reviews;

  NannyReviewsModel({
    this.averageRating,
    this.totalReviews,
    this.starCounts,
    this.reviews,
  });

  factory NannyReviewsModel.fromRawJson(String str) =>
      NannyReviewsModel.fromJson(json.decode(str));

  factory NannyReviewsModel.fromJson(Map<String, dynamic> json) => NannyReviewsModel(
    averageRating: json["averageRating"],
    totalReviews: json["totalReviews"],
    starCounts: Map.from(json["starCounts"]!).map((k, v) => MapEntry<String, int>(k, v)),
    reviews: json["reviews"] == null
        ? []
        : List<Review2>.from(json["reviews"]!.map((x) => Review2.fromJson(x))),
  );
}

class Review2 {
  int? ratingValue;
  String? feedback;
  User? fromUser;
  User? toUser;

  Review2({this.ratingValue, this.feedback, this.fromUser, this.toUser});

  factory Review2.fromRawJson(String str) => Review2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review2.fromJson(Map<String, dynamic> json) => Review2(
    ratingValue: json["ratingValue"],
    feedback: json["feedback"],
    fromUser: json["fromUser"] == null ? null : User.fromJson(json["fromUser"]),
    toUser: json["toUser"] == null ? null : User.fromJson(json["toUser"]),
  );

  Map<String, dynamic> toJson() => {
    "ratingValue": ratingValue,
    "feedback": feedback,
    "fromUser": fromUser?.toJson(),
    "toUser": toUser?.toJson(),
  };
}

class User {
  String? name;
  String? profileImage;
  String? role;
  String? id;

  User({this.name, this.profileImage, this.role, this.id});

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    profileImage: json["profileImage"],
    role: json["role"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "profileImage": profileImage,
    "role": role,
    "_id": id,
  };
}
