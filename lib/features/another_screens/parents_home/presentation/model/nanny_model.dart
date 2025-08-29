import 'dart:convert';

class NannyModel {
  String? id;
  String? name;
  String? role;
  String? email;
  String? profileImage;
  String? stripeAccountId;
  Location? location;
  String? gender;
  int? kidsManage;
  String? address;
  String? nannyAbout;
  DateTime? dateOfBirth;
  int? distance;
  List<Servicerate>? servicerates;
  Professionalbackgrounds? professionalbackgrounds;
  List<Gallery>? galleries;
  List<Availability>? availability;
  List<Preference>? preferences;
  bool? isBookmark;
  int? totalReviews;
  int? averageRating;
  Map<String, int>? starCounts;

  NannyModel({
    this.id,
    this.name,
    this.role,
    this.email,
    this.profileImage,
    this.stripeAccountId,
    this.location,
    this.gender,
    this.kidsManage,
    this.address,
    this.nannyAbout,
    this.dateOfBirth,
    this.distance,
    this.servicerates,
    this.professionalbackgrounds,
    this.galleries,
    this.availability,
    this.preferences,
    this.isBookmark,
    this.totalReviews,
    this.averageRating,
    this.starCounts,
  });

  factory NannyModel.fromRawJson(String str) => NannyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NannyModel.fromJson(Map<String, dynamic> json) => NannyModel(
    id: json["_id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    profileImage: json["profileImage"],
    stripeAccountId: json["stripeAccountId"],
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    gender: json["gender"],
    kidsManage: json["kidsManage"],
    address: json["address"],
    nannyAbout: json["nannyAbout"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    distance: json["distance"],
    servicerates: json["servicerates"] == null
        ? []
        : List<Servicerate>.from(
            json["servicerates"]!.map((x) => Servicerate.fromJson(x)),
          ),
    professionalbackgrounds: json["professionalbackgrounds"] == null
        ? null
        : Professionalbackgrounds.fromJson(json["professionalbackgrounds"]),
    galleries: json["galleries"] == null
        ? []
        : List<Gallery>.from(json["galleries"]!.map((x) => Gallery.fromJson(x))),
    availability: json["availability"] == null
        ? []
        : List<Availability>.from(
            json["availability"]!.map((x) => Availability.fromJson(x)),
          ),
    preferences: json["preferences"] == null
        ? []
        : List<Preference>.from(json["preferences"]!.map((x) => Preference.fromJson(x))),
    isBookmark: json["isBookmark"],
    totalReviews: json["totalReviews"],
    averageRating: json["averageRating"],
    starCounts: json["starCounts"] == null
        ? {}
        : Map.from(json["starCounts"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "role": role,
    "email": email,
    "profileImage": profileImage,
    "stripeAccountId": stripeAccountId,
    "location": location?.toJson(),
    "gender": gender,
    "kidsManage": kidsManage,
    "address": address,
    "nannyAbout": nannyAbout,
    "dateOfBirth":
        "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "distance": distance,
    "servicerates": servicerates == null
        ? []
        : List<dynamic>.from(servicerates!.map((x) => x.toJson())),
    "professionalbackgrounds": professionalbackgrounds?.toJson(),
    "galleries": galleries == null
        ? []
        : List<dynamic>.from(galleries!.map((x) => x.toJson())),
    "availability": availability == null
        ? []
        : List<dynamic>.from(availability!.map((x) => x.toJson())),
    "preferences": preferences == null
        ? []
        : List<dynamic>.from(preferences!.map((x) => x.toJson())),
    "isBookmark": isBookmark,
    "totalReviews": totalReviews,
    "averageRating": averageRating,
    "starCounts": Map.from(starCounts!).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Availability {
  String? id;
  String? nannyId;
  DateTime? createdAt;
  DateTime? updatedAt;
  WeeklyAvailability? weeklyAvailability;

  Availability({
    this.id,
    this.nannyId,
    this.createdAt,
    this.updatedAt,
    this.weeklyAvailability,
  });

  factory Availability.fromRawJson(String str) => Availability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    id: json["_id"],
    nannyId: json["nannyId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    weeklyAvailability: json["weeklyAvailability"] == null
        ? null
        : WeeklyAvailability.fromJson(json["weeklyAvailability"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nannyId": nannyId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "weeklyAvailability": weeklyAvailability?.toJson(),
  };
}

class WeeklyAvailability {
  Day? friday;
  Day? monday;
  Day? saturday;
  Day? sunday;
  Day? thursday;
  Day? tuesday;
  Day? wednesday;

  WeeklyAvailability({
    this.friday,
    this.monday,
    this.saturday,
    this.sunday,
    this.thursday,
    this.tuesday,
    this.wednesday,
  });

  factory WeeklyAvailability.fromRawJson(String str) =>
      WeeklyAvailability.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeeklyAvailability.fromJson(Map<String, dynamic> json) => WeeklyAvailability(
    friday: json["Friday"] == null ? null : Day.fromJson(json["Friday"]),
    monday: json["Monday"] == null ? null : Day.fromJson(json["Monday"]),
    saturday: json["Saturday"] == null ? null : Day.fromJson(json["Saturday"]),
    sunday: json["Sunday"] == null ? null : Day.fromJson(json["Sunday"]),
    thursday: json["Thursday"] == null ? null : Day.fromJson(json["Thursday"]),
    tuesday: json["Tuesday"] == null ? null : Day.fromJson(json["Tuesday"]),
    wednesday: json["Wednesday"] == null ? null : Day.fromJson(json["Wednesday"]),
  );

  Map<String, dynamic> toJson() => {
    "Friday": friday?.toJson(),
    "Monday": monday?.toJson(),
    "Saturday": saturday?.toJson(),
    "Sunday": sunday?.toJson(),
    "Thursday": thursday?.toJson(),
    "Tuesday": tuesday?.toJson(),
    "Wednesday": wednesday?.toJson(),
  };
}

class Day {
  bool? isAvailable;
  Slot? slot;

  Day({this.isAvailable, this.slot});

  factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    isAvailable: json["isAvailable"],
    slot: json["slot"] == null ? null : Slot.fromJson(json["slot"]),
  );

  Map<String, dynamic> toJson() => {"isAvailable": isAvailable, "slot": slot?.toJson()};
}

class Slot {
  String? endTime;
  String? startTime;

  Slot({this.endTime, this.startTime});

  factory Slot.fromRawJson(String str) => Slot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Slot.fromJson(Map<String, dynamic> json) =>
      Slot(endTime: json["endTime"], startTime: json["startTime"]);

  Map<String, dynamic> toJson() => {"endTime": endTime, "startTime": startTime};
}

class Gallery {
  String? id;
  String? nannyId;
  int? v;
  DateTime? createdAt;
  List<Image>? images;
  DateTime? updatedAt;

  Gallery({this.id, this.nannyId, this.v, this.createdAt, this.images, this.updatedAt});

  factory Gallery.fromRawJson(String str) => Gallery.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
    id: json["_id"],
    nannyId: json["nannyId"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    images: json["images"] == null
        ? []
        : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nannyId": nannyId,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Image {
  String? url;
  String? id;
  DateTime? createdAt;

  Image({this.url, this.id, this.createdAt});

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    id: json["_id"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null
        ? []
        : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null
        ? []
        : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class Preference {
  String? id;
  String? nannyId;
  List<String>? ageGroupsYouWorkWith;
  DateTime? createdAt;
  List<String>? serviceYouOffer;
  DateTime? updatedAt;

  Preference({
    this.id,
    this.nannyId,
    this.ageGroupsYouWorkWith,
    this.createdAt,
    this.serviceYouOffer,
    this.updatedAt,
  });

  factory Preference.fromRawJson(String str) => Preference.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
    id: json["_id"],
    nannyId: json["nannyId"],
    ageGroupsYouWorkWith: json["ageGroupsYouWorkWith"] == null
        ? []
        : List<String>.from(json["ageGroupsYouWorkWith"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    serviceYouOffer: json["serviceYouOffer"] == null
        ? []
        : List<String>.from(json["serviceYouOffer"]!.map((x) => x)),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nannyId": nannyId,
    "ageGroupsYouWorkWith": ageGroupsYouWorkWith == null
        ? []
        : List<dynamic>.from(ageGroupsYouWorkWith!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "serviceYouOffer": serviceYouOffer == null
        ? []
        : List<dynamic>.from(serviceYouOffer!.map((x) => x)),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Professionalbackgrounds {
  String? id;
  String? nannyId;
  List<String>? certifications;
  DateTime? createdAt;
  int? totalExperienceInYears;
  DateTime? updatedAt;
  List<WorkExperience>? workExperience;

  Professionalbackgrounds({
    this.id,
    this.nannyId,
    this.certifications,
    this.createdAt,
    this.totalExperienceInYears,
    this.updatedAt,
    this.workExperience,
  });

  factory Professionalbackgrounds.fromRawJson(String str) =>
      Professionalbackgrounds.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Professionalbackgrounds.fromJson(Map<String, dynamic> json) =>
      Professionalbackgrounds(
        id: json["_id"],
        nannyId: json["nannyId"],
        certifications: json["certifications"] == null
            ? []
            : List<String>.from(json["certifications"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        totalExperienceInYears: json["totalExperienceInYears"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        workExperience: json["workExperience"] == null
            ? []
            : List<WorkExperience>.from(
                json["workExperience"]!.map((x) => WorkExperience.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nannyId": nannyId,
    "certifications": certifications == null
        ? []
        : List<dynamic>.from(certifications!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "totalExperienceInYears": totalExperienceInYears,
    "updatedAt": updatedAt?.toIso8601String(),
    "workExperience": workExperience == null
        ? []
        : List<dynamic>.from(workExperience!.map((x) => x.toJson())),
  };
}

class WorkExperience {
  String? position;
  String? company;
  String? location;
  String? startDate;
  String? endDate;
  bool? isCurrentWorking;
  String? id;

  WorkExperience({
    this.position,
    this.company,
    this.location,
    this.startDate,
    this.endDate,
    this.isCurrentWorking,
    this.id,
  });

  factory WorkExperience.fromRawJson(String str) =>
      WorkExperience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
    position: json["position"],
    company: json["company"],
    location: json["location"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    isCurrentWorking: json["isCurrentWorking"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "position": position,
    "company": company,
    "location": location,
    "startDate": startDate,
    "endDate": endDate,
    "isCurrentWorking": isCurrentWorking,
    "_id": id,
  };
}

class Servicerate {
  String? id;
  String? nannyId;
  bool? acceptsOverNight;
  DateTime? createdAt;
  String? currency;
  int? dayRate;
  int? hourlyRate;
  int? overNightRate;
  DateTime? updatedAt;

  Servicerate({
    this.id,
    this.nannyId,
    this.acceptsOverNight,
    this.createdAt,
    this.currency,
    this.dayRate,
    this.hourlyRate,
    this.overNightRate,
    this.updatedAt,
  });

  factory Servicerate.fromRawJson(String str) => Servicerate.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Servicerate.fromJson(Map<String, dynamic> json) => Servicerate(
    id: json["_id"],
    nannyId: json["nannyId"],
    acceptsOverNight: json["acceptsOverNight"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    currency: json["currency"],
    dayRate: json["dayRate"],
    hourlyRate: json["hourlyRate"],
    overNightRate: json["overNightRate"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "nannyId": nannyId,
    "acceptsOverNight": acceptsOverNight,
    "createdAt": createdAt?.toIso8601String(),
    "currency": currency,
    "dayRate": dayRate,
    "hourlyRate": hourlyRate,
    "overNightRate": overNightRate,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
