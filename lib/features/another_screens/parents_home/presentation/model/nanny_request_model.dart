// nanny_booking_request_model.dart
import 'dart:convert';
import 'nanny_model.dart'; // <-- adjust path if needed (where NannyModel & Location are defined)

/// Helpers to parse raw json
NannyBookingRequestModel nannyBookingRequestModelFromJson(String str) =>
    NannyBookingRequestModel.fromJson(json.decode(str) as Map<String, dynamic>);

String nannyBookingRequestModelToJson(NannyBookingRequestModel data) =>
    json.encode(data.toJson());

/// Root response model for "Nanny new booking requests"
class NannyBookingRequestModel {
  final bool success;
  final String message;
  final int statusCode;
  final NannyBookingRequestData data;

  NannyBookingRequestModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory NannyBookingRequestModel.fromJson(Map<String, dynamic> json) {
    return NannyBookingRequestModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: NannyBookingRequestData.fromJson(
        json['data'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'statusCode': statusCode,
    'data': data.toJson(),
  };
}

/// Wrapper for bookings + meta
class NannyBookingRequestData {
  final List<NannyBookingRequestEntry> data;
  final NannyBookingRequestMeta meta;

  NannyBookingRequestData({required this.data, required this.meta});

  factory NannyBookingRequestData.fromJson(Map<String, dynamic> json) {
    return NannyBookingRequestData(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => NannyBookingRequestEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: NannyBookingRequestMeta.fromJson(
        json['meta'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList(),
    'meta': meta.toJson(),
  };
}

/// Pagination meta
class NannyBookingRequestMeta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  NannyBookingRequestMeta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory NannyBookingRequestMeta.fromJson(Map<String, dynamic> json) {
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse('$v') ?? 0;
    }

    return NannyBookingRequestMeta(
      total: _toInt(json['total']),
      page: _toInt(json['page']),
      limit: _toInt(json['limit']),
      totalPages: _toInt(json['totalPages']),
    );
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'page': page,
    'limit': limit,
    'totalPages': totalPages,
  };
}

/// Single booking entry
class NannyBookingRequestEntry {
  final String id;
  final NannyBookingRequestParent parentId;
  final NannyModel? nannyId; // reuse your NannyModel
  final List<NannyBookingRequestChild> childrenId;
  final String bookingType;
  final String bookingStatus;
  final NannyServiceRate? serviceRate;
  final String paymentIntentId;
  final String specialInstruction;
  final double extraBabyCharge;
  final int? bookedHours;
  final NannyHourlyBooking? hourlyBooking;
  final NannyFullDayBooking? fullDayBooking;
  final List<NannyCustomBooking> customBooking;
  final double totalPayable;
  final String paymentStatus;
  final String paymentId;
  final double platformFee;
  final double nannyEarning;
  final bool isCancelledByNanny;
  final bool isCancelledByParent;
  final int rescheduleCount;
  final List<dynamic> rescheduleHistory;
  final List<NannyExtensionHistory> extensionHistory;
  final String createdAt;
  final String updatedAt;

  NannyBookingRequestEntry({
    required this.id,
    required this.parentId,
    required this.nannyId,
    required this.childrenId,
    required this.bookingType,
    required this.bookingStatus,
    this.serviceRate,
    required this.paymentIntentId,
    required this.specialInstruction,
    required this.extraBabyCharge,
    this.bookedHours,
    this.hourlyBooking,
    this.fullDayBooking,
    required this.customBooking,
    required this.totalPayable,
    required this.paymentStatus,
    required this.paymentId,
    required this.platformFee,
    required this.nannyEarning,
    required this.isCancelledByNanny,
    required this.isCancelledByParent,
    required this.rescheduleCount,
    required this.rescheduleHistory,
    required this.extensionHistory,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NannyBookingRequestEntry.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse('$v') ?? 0;
    }

    return NannyBookingRequestEntry(
      id: json['_id'] ?? '',
      parentId: NannyBookingRequestParent.fromJson(
        json['parentId'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      nannyId: json['nannyId'] != null
          ? NannyModel.fromJson(json['nannyId'] as Map<String, dynamic>)
          : null,
      childrenId: (json['childrenId'] as List<dynamic>? ?? [])
          .map((e) => NannyBookingRequestChild.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingType: json['bookingType'] ?? '',
      bookingStatus: json['bookingStatus'] ?? '',
      serviceRate: json['serviceRate'] != null
          ? NannyServiceRate.fromJson(json['serviceRate'] as Map<String, dynamic>)
          : null,
      paymentIntentId: json['paymentIntentId'] ?? '',
      specialInstruction: json['specialInstruction'] ?? '',
      extraBabyCharge: _toDouble(json['extraBabyCharge']),
      bookedHours: json['bookedHours'] != null ? _toInt(json['bookedHours']) : null,
      hourlyBooking: json['hourlyBooking'] != null
          ? NannyHourlyBooking.fromJson(json['hourlyBooking'] as Map<String, dynamic>)
          : null,
      fullDayBooking: json['fullDayBooking'] != null
          ? NannyFullDayBooking.fromJson(json['fullDayBooking'] as Map<String, dynamic>)
          : null,
      customBooking: (json['customBooking'] as List<dynamic>? ?? [])
          .map((e) => NannyCustomBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPayable: _toDouble(json['totalPayable']),
      paymentStatus: json['paymentStatus'] ?? '',
      paymentId: json['paymentId'] ?? '',
      platformFee: _toDouble(json['platformFee']),
      nannyEarning: _toDouble(json['nannyEarning']),
      isCancelledByNanny: json['isCancelledByNanny'] ?? false,
      isCancelledByParent: json['isCancelledByParent'] ?? false,
      rescheduleCount: _toInt(json['rescheduleCount']),
      rescheduleHistory: (json['rescheduleHistory'] as List<dynamic>? ?? []),
      extensionHistory: (json['extensionHistory'] as List<dynamic>? ?? [])
          .map((e) => NannyExtensionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'parentId': parentId.toJson(),
    'nannyId': nannyId?.toJson(),
    'childrenId': childrenId.map((e) => e.toJson()).toList(),
    'bookingType': bookingType,
    'bookingStatus': bookingStatus,
    'serviceRate': serviceRate?.toJson(),
    'paymentIntentId': paymentIntentId,
    'specialInstruction': specialInstruction,
    'extraBabyCharge': extraBabyCharge,
    'bookedHours': bookedHours,
    'hourlyBooking': hourlyBooking?.toJson(),
    'fullDayBooking': fullDayBooking?.toJson(),
    'customBooking': customBooking.map((e) => e.toJson()).toList(),
    'totalPayable': totalPayable,
    'paymentStatus': paymentStatus,
    'paymentId': paymentId,
    'platformFee': platformFee,
    'nannyEarning': nannyEarning,
    'isCancelledByNanny': isCancelledByNanny,
    'isCancelledByParent': isCancelledByParent,
    'rescheduleCount': rescheduleCount,
    'rescheduleHistory': rescheduleHistory,
    'extensionHistory': extensionHistory.map((e) => e.toJson()).toList(),
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

/// Parent model (matches JSON parentId structure)
class NannyBookingRequestParent {
  final String id;
  final String name;
  final String role;
  final String email;
  final String profileImage;
  final String status;
  final String stripeAccountId;
  final Location location; // reuse Location from nanny_model.dart
  final bool verified;
  final String createdAt;
  final String updatedAt;
  final int? v;
  final bool? available;
  final String? address;
  final String? phone;
  final String? dateOfBirth;
  final String? gender;

  NannyBookingRequestParent({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.profileImage,
    required this.status,
    required this.stripeAccountId,
    required this.location,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    this.v,
    this.available,
    this.address,
    this.phone,
    this.dateOfBirth,
    this.gender,
  });

  factory NannyBookingRequestParent.fromJson(Map<String, dynamic> json) {
    return NannyBookingRequestParent(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
      status: json['status'] ?? '',
      stripeAccountId: json['stripeAccountId'] ?? '',
      location: Location.fromJson(
        json['location'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      verified: json['verified'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] is int
          ? json['__v'] as int
          : (json['__v'] != null ? int.tryParse('${json['__v']}') : null),
      available: json['available'],
      address: json['address'],
      phone: json['phone'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'name': name,
    'role': role,
    'email': email,
    'profileImage': profileImage,
    'status': status,
    'stripeAccountId': stripeAccountId,
    'location': location.toJson(),
    'verified': verified,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': v,
    'available': available,
    'address': address,
    'phone': phone,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
  };
}

/// Child model (childrenId)
class NannyBookingRequestChild {
  final String id;
  final String userId;
  final String name;
  final String dateOfBirth;
  final String gender;
  final String childImage;
  final String createdAt;
  final String updatedAt;

  NannyBookingRequestChild({
    required this.id,
    required this.userId,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.childImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NannyBookingRequestChild.fromJson(Map<String, dynamic> json) {
    return NannyBookingRequestChild(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      gender: json['gender'] ?? '',
      childImage: json['childImage'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'userId': userId,
    'name': name,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'childImage': childImage,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

/// ServiceRate (serviceRate)
class NannyServiceRate {
  final String nannyId;
  final double hourlyRate;
  final double dayRate;
  final String currency;
  final bool acceptsOverNight;
  final String id;

  NannyServiceRate({
    required this.nannyId,
    required this.hourlyRate,
    required this.dayRate,
    required this.currency,
    required this.acceptsOverNight,
    required this.id,
  });

  factory NannyServiceRate.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    return NannyServiceRate(
      nannyId: json['nannyId'] ?? '',
      hourlyRate: _toDouble(json['hourlyRate']),
      dayRate: _toDouble(json['dayRate']),
      currency: json['currency'] ?? '',
      acceptsOverNight: json['acceptsOverNight'] ?? false,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'nannyId': nannyId,
    'hourlyRate': hourlyRate,
    'dayRate': dayRate,
    'currency': currency,
    'acceptsOverNight': acceptsOverNight,
    '_id': id,
  };
}

/// Hourly booking (if present)
class NannyHourlyBooking {
  final String date;
  final String startTime;
  final String endTime;

  NannyHourlyBooking({
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory NannyHourlyBooking.fromJson(Map<String, dynamic> json) => NannyHourlyBooking(
    date: json['date'] ?? '',
    startTime: json['startTime'] ?? '',
    endTime: json['endTime'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'date': date,
    'startTime': startTime,
    'endTime': endTime,
  };
}

/// FullDay booking object
class NannyFullDayBooking {
  final List<String> fullDays;
  final bool hasOverTime;
  final int overTimeHours;

  NannyFullDayBooking({
    required this.fullDays,
    required this.hasOverTime,
    required this.overTimeHours,
  });

  factory NannyFullDayBooking.fromJson(Map<String, dynamic> json) {
    return NannyFullDayBooking(
      fullDays: (json['fullDays'] as List<dynamic>? ?? []).map((e) => '$e').toList(),
      hasOverTime: json['hasOverTime'] ?? false,
      overTimeHours: json['overTimeHours'] is int
          ? json['overTimeHours'] as int
          : int.tryParse('${json['overTimeHours']}') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'fullDays': fullDays,
    'hasOverTime': hasOverTime,
    'overTimeHours': overTimeHours,
  };
}

/// CustomBooking entries
class NannyCustomBooking {
  final String date;
  final String startTime;
  final String endTime;
  final String id;

  NannyCustomBooking({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.id,
  });

  factory NannyCustomBooking.fromJson(Map<String, dynamic> json) {
    return NannyCustomBooking(
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date,
    'startTime': startTime,
    'endTime': endTime,
    '_id': id,
  };
}

/// ExtensionHistory
class NannyExtensionHistory {
  final String id;
  final String extendedAt;
  final String date;
  final int addedHours;
  final double extraAmount;

  NannyExtensionHistory({
    required this.id,
    required this.extendedAt,
    required this.date,
    required this.addedHours,
    required this.extraAmount,
  });

  factory NannyExtensionHistory.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    return NannyExtensionHistory(
      id: json['_id'] ?? '',
      extendedAt: json['extendedAt'] ?? '',
      date: json['date'] ?? '',
      addedHours: (json['addedHours'] is int
          ? json['addedHours'] as int
          : int.tryParse('${json['addedHours']}') ?? 0),
      extraAmount: _toDouble(json['extraAmount']),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'extendedAt': extendedAt,
    'date': date,
    'addedHours': addedHours,
    'extraAmount': extraAmount,
  };
}
