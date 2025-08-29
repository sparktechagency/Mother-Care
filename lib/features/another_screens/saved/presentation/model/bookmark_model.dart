import 'dart:convert';

class BookmarkModel {
    String? id;
    DateTime? createdAt;
    Parent? parent;
    Nanny? nanny;
    ServiceRate? serviceRate;

    BookmarkModel({
        this.id,
        this.createdAt,
        this.parent,
        this.nanny,
        this.serviceRate,
    });

    factory BookmarkModel.fromRawJson(String str) => BookmarkModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        nanny: json["nanny"] == null ? null : Nanny.fromJson(json["nanny"]),
        serviceRate: json["serviceRate"] == null ? null : ServiceRate.fromJson(json["serviceRate"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "parent": parent?.toJson(),
        "nanny": nanny?.toJson(),
        "serviceRate": serviceRate?.toJson(),
    };
}

class Nanny {
    String? id;
    String? name;
    String? email;
    String? profileImage;
    Location? location;
    String? gender;
    String? address;
    int? averageRating;
    int? totalReviews;

    Nanny({
        this.id,
        this.name,
        this.email,
        this.profileImage,
        this.location,
        this.gender,
        this.address,
        this.averageRating,
        this.totalReviews,
    });

    factory Nanny.fromRawJson(String str) => Nanny.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Nanny.fromJson(Map<String, dynamic> json) => Nanny(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        profileImage: json["profileImage"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        gender: json["gender"],
        address: json["address"],
        averageRating: json["averageRating"],
        totalReviews: json["totalReviews"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "profileImage": profileImage,
        "location": location?.toJson(),
        "gender": gender,
        "address": address,
        "averageRating": averageRating,
        "totalReviews": totalReviews,
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

class Parent {
    String? id;
    String? name;
    String? email;
    String? profileImage;
    Location? location;
    String? address;

    Parent({
        this.id,
        this.name,
        this.email,
        this.profileImage,
        this.location,
        this.address,
    });

    factory Parent.fromRawJson(String str) => Parent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        profileImage: json["profileImage"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "profileImage": profileImage,
        "location": location?.toJson(),
        "address": address,
    };
}

class ServiceRate {
    bool? acceptsOverNight;
    String? currency;
    int? dayRate;
    int? hourlyRate;
    int? overNightRate;

    ServiceRate({
        this.acceptsOverNight,
        this.currency,
        this.dayRate,
        this.hourlyRate,
        this.overNightRate,
    });

    factory ServiceRate.fromRawJson(String str) => ServiceRate.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ServiceRate.fromJson(Map<String, dynamic> json) => ServiceRate(
        acceptsOverNight: json["acceptsOverNight"],
        currency: json["currency"],
        dayRate: json["dayRate"],
        hourlyRate: json["hourlyRate"],
        overNightRate: json["overNightRate"],
    );

    Map<String, dynamic> toJson() => {
        "acceptsOverNight": acceptsOverNight,
        "currency": currency,
        "dayRate": dayRate,
        "hourlyRate": hourlyRate,
        "overNightRate": overNightRate,
    };
}
