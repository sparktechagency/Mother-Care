import 'dart:convert';

class ChildrenListModel {
    String? id;
    bool? isSelected;
    String? userId;
    String? name;
    String? dateOfBirth;
    String? gender;
    String? childImage;
    DateTime? createdAt;
    DateTime? updatedAt;

    ChildrenListModel({
        this.id,
        this.userId,
        this.name,
        this.isSelected=false,
        this.dateOfBirth,
        this.gender,
        this.childImage,
        this.createdAt,
        this.updatedAt,
    });

    factory ChildrenListModel.fromRawJson(String str) => ChildrenListModel.fromJson(json.decode(str));


    factory ChildrenListModel.fromJson(Map<String, dynamic> json) => ChildrenListModel(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        childImage: json["childImage"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );


}
 