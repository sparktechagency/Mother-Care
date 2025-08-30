import 'dart:convert';

class NannyDetailsModel {
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
  String? dateOfBirth;
  List<Servicerate>? servicerates;
  List<Professionalbackground>? professionalbackgrounds;
  List<Availability>? galleries;
  List<Availability>? availability;
  List<Preference>? preferences;
  List<Review>? reviews;
  int? averageRating;
  int? totalReviews;
  Map<String, int>? starCounts;

  NannyDetailsModel({
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
    this.servicerates,
    this.professionalbackgrounds,
    this.galleries,
    this.availability,
    this.preferences,
    this.reviews,
    this.averageRating,
    this.totalReviews,
    this.starCounts,
  });

  factory NannyDetailsModel.fromRawJson(String str) =>
      NannyDetailsModel.fromJson(json.decode(str));

  factory NannyDetailsModel.fromJson(Map<String, dynamic> json) => NannyDetailsModel(
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
    dateOfBirth: json["dateOfBirth"],
    servicerates: json["servicerates"] == null
        ? []
        : List<Servicerate>.from(
            json["servicerates"]!.map((x) => Servicerate.fromJson(x)),
          ),
    professionalbackgrounds: json["professionalbackgrounds"] == null
        ? []
        : List<Professionalbackground>.from(
            json["professionalbackgrounds"]!.map(
              (x) => Professionalbackground.fromJson(x),
            ),
          ),
    galleries: json["galleries"] == null
        ? []
        : List<Availability>.from(
            json["galleries"]!.map((x) => Availability.fromJson(x)),
          ),
    availability: json["availability"] == null
        ? []
        : List<Availability>.from(
            json["availability"]!.map((x) => Availability.fromJson(x)),
          ),
    preferences: json["preferences"] == null
        ? []
        : List<Preference>.from(json["preferences"]!.map((x) => Preference.fromJson(x))),
    reviews: json["reviews"] == null
        ? []
        : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    averageRating: json["averageRating"],
    totalReviews: json["totalReviews"],
    starCounts: Map.from(json["starCounts"]!).map((k, v) => MapEntry<String, int>(k, v)),
  );
}

class Availability {
  String? id;
  String? nannyId;
  DateTime? createdAt;
  DateTime? updatedAt;
  WeeklyAvailability? weeklyAvailability;
  List<String>? images;

  Availability({
    this.id,
    this.nannyId,
    this.createdAt,
    this.updatedAt,
    this.weeklyAvailability,
    this.images,
  });

  factory Availability.fromRawJson(String str) => Availability.fromJson(json.decode(str));

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    id: json["_id"],
    nannyId: json["nannyId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    weeklyAvailability: json["weeklyAvailability"] == null
        ? null
        : WeeklyAvailability.fromJson(json["weeklyAvailability"]),
    images: json["images"] == null
        ? []
        : List<String>.from(json["images"]!.map((x) => x)),
  );
}

class WeeklyAvailability {
  FridayClass? friday;
  FridayClass? monday;
  FridayClass? saturday;
  FridayClass? sunday;
  FridayClass? thursday;
  FridayClass? tuesday;
  FridayClass? wednesday;

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

  factory WeeklyAvailability.fromJson(Map<String, dynamic> json) => WeeklyAvailability(
    friday: json["Friday"] == null ? null : FridayClass.fromJson(json["Friday"]),
    monday: json["Monday"] == null ? null : FridayClass.fromJson(json["Monday"]),
    saturday: json["Saturday"] == null ? null : FridayClass.fromJson(json["Saturday"]),
    sunday: json["Sunday"] == null ? null : FridayClass.fromJson(json["Sunday"]),
    thursday: json["Thursday"] == null ? null : FridayClass.fromJson(json["Thursday"]),
    tuesday: json["Tuesday"] == null ? null : FridayClass.fromJson(json["Tuesday"]),
    wednesday: json["Wednesday"] == null ? null : FridayClass.fromJson(json["Wednesday"]),
  );
}

class FridayClass {
  bool? isAvailable;
  Slot? slot;

  FridayClass({this.isAvailable, this.slot});

  factory FridayClass.fromRawJson(String str) => FridayClass.fromJson(json.decode(str));

  factory FridayClass.fromJson(Map<String, dynamic> json) => FridayClass(
    isAvailable: json["isAvailable"],
    slot: json["slot"] == null ? null : Slot.fromJson(json["slot"]),
  );
}

class Slot {
  String? endTime;
  String? startTime;

  Slot({this.endTime, this.startTime});

  factory Slot.fromRawJson(String str) => Slot.fromJson(json.decode(str));

  factory Slot.fromJson(Map<String, dynamic> json) =>
      Slot(endTime: json["endTime"], startTime: json["startTime"]);
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null
        ? []
        : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );
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
}

class Professionalbackground {
  String? id;
  String? nannyId;
  List<String>? certifications;
  DateTime? createdAt;
  int? totalExperienceInYears;
  DateTime? updatedAt;
  List<WorkExperience>? workExperience;

  Professionalbackground({
    this.id,
    this.nannyId,
    this.certifications,
    this.createdAt,
    this.totalExperienceInYears,
    this.updatedAt,
    this.workExperience,
  });

  factory Professionalbackground.fromRawJson(String str) =>
      Professionalbackground.fromJson(json.decode(str));

  factory Professionalbackground.fromJson(Map<String, dynamic> json) =>
      Professionalbackground(
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

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
    position: json["position"],
    company: json["company"],
    location: json["location"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    isCurrentWorking: json["isCurrentWorking"],
    id: json["_id"],
  );
}

class Review {
  int? ratingValue;
  String? feedback;
  FromUser? fromUser;

  Review({this.ratingValue, this.feedback, this.fromUser});

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    ratingValue: json["ratingValue"],
    feedback: json["feedback"],
    fromUser: json["fromUser"] == null ? null : FromUser.fromJson(json["fromUser"]),
  );
}

class FromUser {
  String? name;
  String? profileImage;
  String? role;
  String? id;

  FromUser({this.name, this.profileImage, this.role, this.id});

  factory FromUser.fromRawJson(String str) => FromUser.fromJson(json.decode(str));

  factory FromUser.fromJson(Map<String, dynamic> json) => FromUser(
    name: json["name"],
    profileImage: json["profileImage"],
    role: json["role"],
    id: json["_id"],
  );
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
}
