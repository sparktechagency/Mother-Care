import 'dart:convert';

class BannerModel {
    String? id;
    String? name;
    String? description;
    String? image;
    String? url;
    bool? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    BannerModel({
        this.id,
        this.name,
        this.description,
        this.image,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory BannerModel.fromRawJson(String str) => BannerModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        url: json["url"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "image": image,
        "url": url,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
