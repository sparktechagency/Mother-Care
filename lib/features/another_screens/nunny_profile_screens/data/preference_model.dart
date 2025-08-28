class PreferenceModel {
  bool isSelected;
  String title;

  PreferenceModel({required this.isSelected, required this.title});
}

class NannyGalleryResponse {
  final bool success;
  final String message;
  final int statusCode;
  final NannyGallery data;

  NannyGalleryResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory NannyGalleryResponse.fromJson(Map<String, dynamic> json) {
    return NannyGalleryResponse(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'statusCode': statusCode,
    'data': data,
  };
}

class NannyGallery {
  final String id;
  final String nannyId;
  final List<String> images;
  final String createdAt;
  final String updatedAt;

  NannyGallery({
    required this.id,
    required this.nannyId,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NannyGallery.fromJson(Map<String, dynamic> json) {
    return NannyGallery(
      id: json['_id'],
      nannyId: json['nannyId'],
      images: List<String>.from(json['images']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'nannyId': nannyId,
    'images': images,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class NannyPreferenceResponse {
  final bool success;
  final String message;
  final int statusCode;
  final NannyPreferenceData data;

  NannyPreferenceResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory NannyPreferenceResponse.fromJson(Map<String, dynamic> json) {
    return NannyPreferenceResponse(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: NannyPreferenceData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'statusCode': statusCode,
      'data': data.toJson(),
    };
  }
}

class NannyPreferenceData {
  final String id;
  final String nannyId;
  final List<String> ageGroupsYouWorkWith;
  final List<String> serviceYouOffer;
  final String createdAt;
  final String updatedAt;

  NannyPreferenceData({
    required this.id,
    required this.nannyId,
    required this.ageGroupsYouWorkWith,
    required this.serviceYouOffer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NannyPreferenceData.fromJson(Map<String, dynamic> json) {
    return NannyPreferenceData(
      id: json['_id'],
      nannyId: json['nannyId'],
      ageGroupsYouWorkWith: List<String>.from(json['ageGroupsYouWorkWith']),
      serviceYouOffer: List<String>.from(json['serviceYouOffer']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'nannyId': nannyId,
      'ageGroupsYouWorkWith': ageGroupsYouWorkWith,
      'serviceYouOffer': serviceYouOffer,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class NannyCertificationExperienceModel {
  bool? success;
  String? message;
  int? statusCode;
  NannyCertificationExperienceData? data;
  NannyCertificationExperienceModel({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory NannyCertificationExperienceModel.fromJson(Map<String, dynamic> json) {
    return NannyCertificationExperienceModel(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] != null
          ? NannyCertificationExperienceData.fromJson(json['data'])
          : null,
    );
  }
}

class NannyCertificationExperienceData {
  String? id;
  String? nannyId;
  List<String>? certifications;
  DateTime? createdAt;
  int? totalExperienceInYears;
  DateTime? updatedAt;
  List<WorkExperience>? workExperience;

  NannyCertificationExperienceData({
    this.id,
    this.nannyId,
    this.certifications,
    this.createdAt,
    this.totalExperienceInYears,
    this.updatedAt,
    this.workExperience,
  });

  factory NannyCertificationExperienceData.fromJson(Map<String, dynamic> json) {
    return NannyCertificationExperienceData(
      id: json['_id'],
      nannyId: json['nannyId'],
      certifications: json['certifications'] != null
          ? List<String>.from(json['certifications'])
          : [],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      totalExperienceInYears: json['totalExperienceInYears'],
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      workExperience: json['workExperience'] != null
          ? List<WorkExperience>.from(
              json['workExperience'].map((x) => WorkExperience.fromJson(x)),
            )
          : [],
    );
  }
}

class WorkExperience {
  String? position;
  String? company;
  String? location;
  String? startDate; // keep as String since it's "dd-mm-yyyy"
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

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      position: json['position'],
      company: json['company'],
      location: json['location'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      isCurrentWorking: json['isCurrentWorking'],
      id: json['_id'],
    );
  }
}
