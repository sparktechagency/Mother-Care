import 'dart:convert';

class ProfileDataModel {
    Location? location;
    String? id;
    String? name;
    String? role;
    String? email;
    String? profileImage;
    String? status;
    String? stripeAccountId;
    bool? verified;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    bool? available;
    String? address;
    String? phone;
    DateTime? dateOfBirth;
    String? gender;





    ProfileDataModel({
        this.location,
        this.id,
        this.name,
        this.role,
        this.email,
        this.profileImage,
        this.status,
        this.stripeAccountId,
        this.verified,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.available,
        this.address,
        this.phone,
        this.dateOfBirth,
        this.gender,
    });

    factory ProfileDataModel.fromRawJson(String str) => ProfileDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        id: json["_id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        profileImage: json["profileImage"],
        status: json["status"],
        stripeAccountId: json["stripeAccountId"],
        verified: json["verified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        available: json["available"],
        address: json["address"],
        phone: json["phone"],
        dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "name": name,
        "role": role,
        "email": email,
        "profileImage": profileImage,
        "status": status,
        "stripeAccountId": stripeAccountId,
        "verified": verified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "available": available,
        "address": address,
        "phone": phone,
        "dateOfBirth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "gender": gender,
    };
}

class Location {
    String? type;
    List<double>? coordinates;

    Location({
        this.type,
        this.coordinates,
    });

    factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}
