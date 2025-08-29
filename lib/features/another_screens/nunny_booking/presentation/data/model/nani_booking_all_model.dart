import 'dart:convert';

//// Coming from api {{local_variable}}/bookings/me/nanny

/// Root response
class NaniBookingAllModel {
  final bool success;
  final String message;
  final int statusCode;
  final NaniAllBookingModelData data;

  NaniBookingAllModel({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory NaniBookingAllModel.fromJson(Map<String, dynamic> json) {
    return NaniBookingAllModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: NaniAllBookingModelData.fromJson(json['data'] ?? <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}

/// Wrapper for data + meta
class NaniAllBookingModelData {
  final List<Booking> data;
  final Meta meta;

  NaniAllBookingModelData({required this.data, required this.meta});

  factory NaniAllBookingModelData.fromJson(Map<String, dynamic> json) {
    return NaniAllBookingModelData(
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => Booking.fromJson((e as Map<String, dynamic>)))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>? ?? <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((e) => e.toJson()).toList(),
    "meta": meta.toJson(),
  };
}

/// Pagination meta
class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: (json['total'] ?? 0) is int
          ? json['total']
          : int.tryParse('${json['total']}') ?? 0,
      page: (json['page'] ?? 0) is int
          ? json['page']
          : int.tryParse('${json['page']}') ?? 0,
      limit: (json['limit'] ?? 0) is int
          ? json['limit']
          : int.tryParse('${json['limit']}') ?? 0,
      totalPages: (json['totalPages'] ?? 0) is int
          ? json['totalPages']
          : int.tryParse('${json['totalPages']}') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
  };
}

/// Main Booking model
class Booking {
  final String id;
  final Parent parentId;
  final Nanny nannyId;
  final List<Child> childrenId;
  final String bookingType;
  final String bookingStatus;
  final ServiceRate? serviceRate;
  final String paymentIntentId;
  final String specialInstruction;
  final double extraBabyCharge;
  final int bookedHours;
  final HourlyBooking? hourlyBooking;
  final FullDayBooking? fullDayBooking;
  final List<CustomBooking> customBooking;
  final double totalPayable;
  final String paymentStatus;
  final String paymentId;
  final double platformFee;
  final double nannyEarning;
  final bool isCancelledByNanny;
  final bool isCancelledByParent;
  final int rescheduleCount;
  final List<RescheduleHistory> rescheduleHistory;
  final List<ExtensionHistory> extensionHistory;
  final String createdAt;
  final String updatedAt;

  Booking({
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
    required this.bookedHours,
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

  factory Booking.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      return double.tryParse('$value') ?? 0.0;
    }

    int _toInt(dynamic value) {
      if (value == null) return 0;
      if (value is int) return value;
      return int.tryParse('$value') ?? 0;
    }

    return Booking(
      id: json['_id'] ?? '',
      parentId: Parent.fromJson(
        json['parentId'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      nannyId: Nanny.fromJson(
        json['nannyId'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      childrenId: (json['childrenId'] as List<dynamic>? ?? [])
          .map((e) => Child.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingType: json['bookingType'] ?? '',
      bookingStatus: json['bookingStatus'] ?? '',
      serviceRate: json['serviceRate'] != null
          ? ServiceRate.fromJson(json['serviceRate'] as Map<String, dynamic>)
          : null,
      paymentIntentId: json['paymentIntentId'] ?? '',
      specialInstruction: json['specialInstruction'] ?? '',
      extraBabyCharge: _toDouble(json['extraBabyCharge'] ?? json['extraBabyCharge']),
      bookedHours: _toInt(json['bookedHours']),
      hourlyBooking: json['hourlyBooking'] != null
          ? HourlyBooking.fromJson(json['hourlyBooking'] as Map<String, dynamic>)
          : null,
      fullDayBooking: json['fullDayBooking'] != null
          ? FullDayBooking.fromJson(json['fullDayBooking'] as Map<String, dynamic>)
          : null,
      customBooking: (json['customBooking'] as List<dynamic>? ?? [])
          .map((e) => CustomBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPayable: _toDouble(json['totalPayable']),
      paymentStatus: json['paymentStatus'] ?? '',
      paymentId: json['paymentId'] ?? '',
      platformFee: _toDouble(json['platformFee']),
      nannyEarning: _toDouble(json['nannyEarning']),
      isCancelledByNanny: json['isCancelledByNanny'] ?? false,
      isCancelledByParent: json['isCancelledByParent'] ?? false,
      rescheduleCount: _toInt(json['rescheduleCount']),
      rescheduleHistory: (json['rescheduleHistory'] as List<dynamic>? ?? [])
          .map(
            (e) => RescheduleHistory.fromJson(
              e is Map<String, dynamic> ? e : <String, dynamic>{},
            ),
          )
          .toList(),
      extensionHistory: (json['extensionHistory'] as List<dynamic>? ?? [])
          .map((e) => ExtensionHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "parentId": parentId.toJson(),
    "nannyId": nannyId.toJson(),
    "childrenId": childrenId.map((e) => e.toJson()).toList(),
    "bookingType": bookingType,
    "bookingStatus": bookingStatus,
    "serviceRate": serviceRate?.toJson(),
    "paymentIntentId": paymentIntentId,
    "specialInstruction": specialInstruction,
    "extraBabyCharge": extraBabyCharge,
    "bookedHours": bookedHours,
    "hourlyBooking": hourlyBooking?.toJson(),
    "fullDayBooking": fullDayBooking?.toJson(),
    "customBooking": customBooking.map((e) => e.toJson()).toList(),
    "totalPayable": totalPayable,
    "paymentStatus": paymentStatus,
    "paymentId": paymentId,
    "platformFee": platformFee,
    "nannyEarning": nannyEarning,
    "isCancelledByNanny": isCancelledByNanny,
    "isCancelledByParent": isCancelledByParent,
    "rescheduleCount": rescheduleCount,
    "rescheduleHistory": rescheduleHistory.map((e) => e.toJson()).toList(),
    "extensionHistory": extensionHistory.map((e) => e.toJson()).toList(),
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

/// Service rate model
class ServiceRate {
  final String nannyId;
  final double hourlyRate;
  final double dayRate;
  final String currency;
  final bool acceptsOverNight;
  final String id;

  ServiceRate({
    required this.nannyId,
    required this.hourlyRate,
    required this.dayRate,
    required this.currency,
    required this.acceptsOverNight,
    required this.id,
  });

  factory ServiceRate.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    return ServiceRate(
      nannyId: json['nannyId'] ?? '',
      hourlyRate: _toDouble(json['hourlyRate']),
      dayRate: _toDouble(json['dayRate']),
      currency: json['currency'] ?? '',
      acceptsOverNight: json['acceptsOverNight'] ?? false,
      id: json['_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "nannyId": nannyId,
    "hourlyRate": hourlyRate,
    "dayRate": dayRate,
    "currency": currency,
    "acceptsOverNight": acceptsOverNight,
    "_id": id,
  };
}

/// Hourly booking
class HourlyBooking {
  final String date;
  final String startTime;
  final String endTime;

  HourlyBooking({required this.date, required this.startTime, required this.endTime});

  factory HourlyBooking.fromJson(Map<String, dynamic> json) {
    return HourlyBooking(
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
  };
}

/// Full day booking
class FullDayBooking {
  final String? startDate;
  final String? endDate;
  final List<String> fullDays;
  final bool hasOverTime;
  final int overTimeHours;

  FullDayBooking({
    this.startDate,
    this.endDate,
    required this.fullDays,
    required this.hasOverTime,
    required this.overTimeHours,
  });

  factory FullDayBooking.fromJson(Map<String, dynamic> json) {
    return FullDayBooking(
      startDate: json['startDate'],
      endDate: json['endDate'],
      fullDays: (json['fullDays'] as List<dynamic>? ?? []).map((e) => '$e').toList(),
      hasOverTime: json['hasOverTime'] ?? false,
      overTimeHours: (json['overTimeHours'] ?? 0) is int
          ? json['overTimeHours']
          : int.tryParse('${json['overTimeHours']}') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "startDate": startDate,
    "endDate": endDate,
    "fullDays": fullDays,
    "hasOverTime": hasOverTime,
    "overTimeHours": overTimeHours,
  };
}

/// Custom booking
class CustomBooking {
  final String id;
  final String date;
  final String startTime;
  final String endTime;

  CustomBooking({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory CustomBooking.fromJson(Map<String, dynamic> json) {
    return CustomBooking(
      id: json['_id'] ?? '',
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
  };
}

/// Extension history
class ExtensionHistory {
  final String id;
  final String extendedAt;
  final String date;
  final int addedHours;
  final double extraAmount;

  ExtensionHistory({
    required this.id,
    required this.extendedAt,
    required this.date,
    required this.addedHours,
    required this.extraAmount,
  });

  factory ExtensionHistory.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    return ExtensionHistory(
      id: json['_id'] ?? '',
      extendedAt: json['extendedAt'] ?? '',
      date: json['date'] ?? '',
      addedHours: (json['addedHours'] ?? 0) is int
          ? json['addedHours']
          : int.tryParse('${json['addedHours']}') ?? 0,
      extraAmount: _toDouble(json['extraAmount']),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "extendedAt": extendedAt,
    "date": date,
    "addedHours": addedHours,
    "extraAmount": extraAmount,
  };
}

/// Reschedule history (typed)
class RescheduleHistory {
  final String id;
  final String rescheduledAt;
  final String? oldDate;
  final String? newDate;
  final String? reason;
  final String? createdAt;
  final String? updatedAt;

  RescheduleHistory({
    required this.id,
    required this.rescheduledAt,
    this.oldDate,
    this.newDate,
    this.reason,
    this.createdAt,
    this.updatedAt,
  });

  factory RescheduleHistory.fromJson(Map<String, dynamic> json) {
    // The API might use different keys. We try common ones with safe fallbacks.
    return RescheduleHistory(
      id: json['_id'] ?? json['id'] ?? '',
      rescheduledAt: json['rescheduledAt'] ?? json['rescheduled_at'] ?? '',
      oldDate: json['oldDate'] ?? json['fromDate'] ?? json['from']?.toString(),
      newDate: json['newDate'] ?? json['toDate'] ?? json['to']?.toString(),
      reason: json['reason'] ?? json['note'] ?? json['reasonDetail'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rescheduledAt": rescheduledAt,
    "oldDate": oldDate,
    "newDate": newDate,
    "reason": reason,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

/// Location model
class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'] ?? '',
      coordinates: (json['coordinates'] as List<dynamic>? ?? []).map((e) {
        if (e is double) return e;
        if (e is int) return e.toDouble();
        return double.tryParse('$e') ?? 0.0;
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() => {"type": type, "coordinates": coordinates};
}

/// Parent model
class Parent {
  final String id;
  final String name;
  final String role;
  final String email;
  final String profileImage;
  final String status;
  final String stripeAccountId;
  final Location location;
  final bool verified;
  final String createdAt;
  final String updatedAt;
  final String? countryCode;
  final bool available;
  final String address;
  final String phone;
  final String dateOfBirth;
  final String gender;

  Parent({
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
    this.countryCode,
    required this.available,
    required this.address,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
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
      countryCode: json['countryCode'],
      available: json['available'] ?? false,
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      gender: json['gender'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "role": role,
    "email": email,
    "profileImage": profileImage,
    "status": status,
    "stripeAccountId": stripeAccountId,
    "location": location.toJson(),
    "verified": verified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "countryCode": countryCode,
    "available": available,
    "address": address,
    "phone": phone,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
  };
}

/// Nanny model
class Nanny {
  final String id;
  final String name;
  final String role;
  final String email;
  final String profileImage;
  final String status;
  final String stripeAccountId;
  final bool verified;
  final String createdAt;
  final String updatedAt;
  final Location location;
  final bool available;
  final String gender;
  final int kidsManage;
  final String? address;
  final String? nannyAbout;
  final String? dateOfBirth;

  Nanny({
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.profileImage,
    required this.status,
    required this.stripeAccountId,
    required this.verified,
    required this.createdAt,
    required this.updatedAt,
    required this.location,
    required this.available,
    required this.gender,
    required this.kidsManage,
    this.address,
    this.nannyAbout,
    this.dateOfBirth,
  });

  factory Nanny.fromJson(Map<String, dynamic> json) {
    return Nanny(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profileImage'] ?? '',
      status: json['status'] ?? '',
      stripeAccountId: json['stripeAccountId'] ?? '',
      verified: json['verified'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      location: Location.fromJson(
        json['location'] as Map<String, dynamic>? ?? <String, dynamic>{},
      ),
      available: json['available'] ?? false,
      gender: json['gender'] ?? '',
      kidsManage: (json['kidsManage'] ?? 0) is int
          ? json['kidsManage']
          : int.tryParse('${json['kidsManage']}') ?? 0,
      address: json['address'],
      nannyAbout: json['nannyAbout'],
      dateOfBirth: json['dateOfBirth'],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "role": role,
    "email": email,
    "profileImage": profileImage,
    "status": status,
    "stripeAccountId": stripeAccountId,
    "verified": verified,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "location": location.toJson(),
    "available": available,
    "gender": gender,
    "kidsManage": kidsManage,
    "address": address,
    "nannyAbout": nannyAbout,
    "dateOfBirth": dateOfBirth,
  };
}

/// Child model
class Child {
  final String id;
  final String userId;
  final String name;
  final String dateOfBirth;
  final String gender;
  final String childImage;
  final String createdAt;
  final String updatedAt;

  Child({
    required this.id,
    required this.userId,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.childImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
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
    "_id": id,
    "userId": userId,
    "name": name,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "childImage": childImage,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

/// Helpers to parse from/to raw JSON string
NaniBookingAllModel nannyBookingResponseFromJson(String str) =>
    NaniBookingAllModel.fromJson(json.decode(str) as Map<String, dynamic>);

String nannyBookingResponseToJson(NaniBookingAllModel data) => json.encode(data.toJson());

// import 'dart:convert';

// //// Coming from api {{local_variable}}/bookings/me/nanny

// /// Root response
// class NaniBookingAllModel {
//   final bool success;
//   final String message;
//   final int statusCode;
//   final NaniAllBookingModelData data;

//   NaniBookingAllModel({
//     required this.success,
//     required this.message,
//     required this.statusCode,
//     required this.data,
//   });

//   factory NaniBookingAllModel.fromJson(Map<String, dynamic> json) {
//     return NaniBookingAllModel(
//       success: json['success'] ?? false,
//       message: json['message'] ?? '',
//       statusCode: json['statusCode'] ?? 0,
//       data: NaniAllBookingModelData.fromJson(json['data']),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "statusCode": statusCode,
//     "data": data.toJson(),
//   };
// }

// /// Wrapper for data + meta
// class NaniAllBookingModelData {
//   final List<Booking> data;
//   final Meta meta;

//   NaniAllBookingModelData({required this.data, required this.meta});

//   factory NaniAllBookingModelData.fromJson(Map<String, dynamic> json) {
//     return NaniAllBookingModelData(
//       data: (json['data'] as List<dynamic>? ?? [])
//           .map((e) => Booking.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "data": data.map((e) => e.toJson()).toList(),
//     "meta": meta.toJson(),
//   };
// }

// /// Pagination meta
// class Meta {
//   final int total;
//   final int page;
//   final int limit;
//   final int totalPages;

//   Meta({
//     required this.total,
//     required this.page,
//     required this.limit,
//     required this.totalPages,
//   });

//   factory Meta.fromJson(Map<String, dynamic> json) {
//     return Meta(
//       total: json['total'] ?? 0,
//       page: json['page'] ?? 0,
//       limit: json['limit'] ?? 0,
//       totalPages: json['totalPages'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "total": total,
//     "page": page,
//     "limit": limit,
//     "totalPages": totalPages,
//   };
// }

// /// Main Booking model
// class Booking {
//   final String id;
//   final Parent parentId;
//   final Nanny nannyId;
//   final List<Child> childrenId;
//   final String bookingType;
//   final String bookingStatus;
//   final ServiceRate? serviceRate; // Made nullable
//   final String paymentIntentId;
//   final String specialInstruction;
//   final double extraBabyCharge;
//   final HourlyBooking? hourlyBooking;
//   final FullDayBooking? fullDayBooking;
//   final List<CustomBooking> customBooking;
//   final double totalPayable;
//   final String paymentStatus;
//   final String paymentId;
//   final double platformFee;
//   final double nannyEarning;
//   final bool isCancelledByNanny;
//   final bool isCancelledByParent;
//   final int rescheduleCount;
//   final List<dynamic> rescheduleHistory;
//   final List<ExtensionHistory> extensionHistory;
//   final String createdAt;
//   final String updatedAt;

//   Booking({
//     required this.id,
//     required this.parentId,
//     required this.nannyId,
//     required this.childrenId,
//     required this.bookingType,
//     required this.bookingStatus,
//     this.serviceRate, // Updated to be optional
//     required this.paymentIntentId,
//     required this.specialInstruction,
//     required this.extraBabyCharge,
//     this.hourlyBooking,
//     this.fullDayBooking,
//     required this.customBooking,
//     required this.totalPayable,
//     required this.paymentStatus,
//     required this.paymentId,
//     required this.platformFee,
//     required this.nannyEarning,
//     required this.isCancelledByNanny,
//     required this.isCancelledByParent,
//     required this.rescheduleCount,
//     required this.rescheduleHistory,
//     required this.extensionHistory,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
//       id: json['_id'] ?? '',
//       parentId: Parent.fromJson(json['parentId'] as Map<String, dynamic>),
//       nannyId: Nanny.fromJson(json['nannyId'] as Map<String, dynamic>),
//       childrenId: (json['childrenId'] as List<dynamic>? ?? [])
//           .map((e) => Child.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       bookingType: json['bookingType'] ?? '',
//       bookingStatus: json['bookingStatus'] ?? '',
//       serviceRate: json['serviceRate'] != null
//           ? ServiceRate.fromJson(json['serviceRate'] as Map<String, dynamic>)
//           : null, // Check for null before parsing
//       paymentIntentId: json['paymentIntentId'] ?? '',
//       specialInstruction: json['specialInstruction'] ?? '',
//       extraBabyCharge: (json['extraBabyCharge'] ?? 0).toDouble(),
//       hourlyBooking: json['hourlyBooking'] != null
//           ? HourlyBooking.fromJson(json['hourlyBooking'] as Map<String, dynamic>)
//           : null,
//       fullDayBooking: json['fullDayBooking'] != null
//           ? FullDayBooking.fromJson(json['fullDayBooking'] as Map<String, dynamic>)
//           : null,
//       customBooking: (json['customBooking'] as List<dynamic>? ?? [])
//           .map((e) => CustomBooking.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       totalPayable: (json['totalPayable'] ?? 0).toDouble(),
//       paymentStatus: json['paymentStatus'] ?? '',
//       paymentId: json['paymentId'] ?? '',
//       platformFee: (json['platformFee'] ?? 0).toDouble(),
//       nannyEarning: (json['nannyEarning'] ?? 0).toDouble(),
//       isCancelledByNanny: json['isCancelledByNanny'] ?? false,
//       isCancelledByParent: json['isCancelledByParent'] ?? false,
//       rescheduleCount: json['rescheduleCount'] ?? 0,
//       rescheduleHistory: (json['rescheduleHistory'] as List<dynamic>? ?? []),
//       extensionHistory: (json['extensionHistory'] as List<dynamic>? ?? [])
//           .map((e) => ExtensionHistory.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "parentId": parentId.toJson(),
//     "nannyId": nannyId.toJson(),
//     "childrenId": childrenId.map((e) => e.toJson()).toList(),
//     "bookingType": bookingType,
//     "bookingStatus": bookingStatus,
//     "serviceRate": serviceRate?.toJson(),
//     "paymentIntentId": paymentIntentId,
//     "specialInstruction": specialInstruction,
//     "extraBabyCharge": extraBabyCharge,
//     "hourlyBooking": hourlyBooking?.toJson(),
//     "fullDayBooking": fullDayBooking?.toJson(),
//     "customBooking": customBooking.map((e) => e.toJson()).toList(),
//     "totalPayable": totalPayable,
//     "paymentStatus": paymentStatus,
//     "paymentId": paymentId,
//     "platformFee": platformFee,
//     "nannyEarning": nannyEarning,
//     "isCancelledByNanny": isCancelledByNanny,
//     "isCancelledByParent": isCancelledByParent,
//     "rescheduleCount": rescheduleCount,
//     "rescheduleHistory": rescheduleHistory,
//     "extensionHistory": extensionHistory.map((e) => e.toJson()).toList(),
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//   };
// }

// /// Service rate model
// class ServiceRate {
//   final String nannyId;
//   final double hourlyRate;
//   final double dayRate;
//   final String currency;
//   final bool acceptsOverNight;
//   final String id;

//   ServiceRate({
//     required this.nannyId,
//     required this.hourlyRate,
//     required this.dayRate,
//     required this.currency,
//     required this.acceptsOverNight,
//     required this.id,
//   });

//   factory ServiceRate.fromJson(Map<String, dynamic> json) {
//     return ServiceRate(
//       nannyId: json['nannyId'] ?? '',
//       hourlyRate: (json['hourlyRate'] ?? 0).toDouble(),
//       dayRate: (json['dayRate'] ?? 0).toDouble(),
//       currency: json['currency'] ?? '',
//       acceptsOverNight: json['acceptsOverNight'] ?? false,
//       id: json['_id'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "nannyId": nannyId,
//     "hourlyRate": hourlyRate,
//     "dayRate": dayRate,
//     "currency": currency,
//     "acceptsOverNight": acceptsOverNight,
//     "_id": id,
//   };
// }

// /// Hourly booking
// class HourlyBooking {
//   final String date;
//   final String startTime;
//   final String endTime;

//   HourlyBooking({required this.date, required this.startTime, required this.endTime});

//   factory HourlyBooking.fromJson(Map<String, dynamic> json) {
//     return HourlyBooking(
//       date: json['date'] ?? '',
//       startTime: json['startTime'] ?? '',
//       endTime: json['endTime'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "date": date,
//     "startTime": startTime,
//     "endTime": endTime,
//   };
// }

// /// Full day booking
// class FullDayBooking {
//   final String? startDate;
//   final String? endDate;
//   final List<String> fullDays;
//   final bool hasOverTime;
//   final int overTimeHours;

//   FullDayBooking({
//     this.startDate,
//     this.endDate,
//     required this.fullDays,
//     required this.hasOverTime,
//     required this.overTimeHours,
//   });

//   factory FullDayBooking.fromJson(Map<String, dynamic> json) {
//     return FullDayBooking(
//       startDate: json['startDate'],
//       endDate: json['endDate'],
//       fullDays: (json['fullDays'] as List<dynamic>? ?? []).cast<String>(),
//       hasOverTime: json['hasOverTime'] ?? false,
//       overTimeHours: json['overTimeHours'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "startDate": startDate,
//     "endDate": endDate,
//     "fullDays": fullDays,
//     "hasOverTime": hasOverTime,
//     "overTimeHours": overTimeHours,
//   };
// }

// /// Custom booking
// class CustomBooking {
//   final String id;
//   final String date;
//   final String startTime;
//   final String endTime;

//   CustomBooking({
//     required this.id,
//     required this.date,
//     required this.startTime,
//     required this.endTime,
//   });

//   factory CustomBooking.fromJson(Map<String, dynamic> json) {
//     return CustomBooking(
//       id: json['_id'] ?? '',
//       date: json['date'] ?? '',
//       startTime: json['startTime'] ?? '',
//       endTime: json['endTime'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "date": date,
//     "startTime": startTime,
//     "endTime": endTime,
//   };
// }

// /// Extension history
// class ExtensionHistory {
//   final String id;
//   final String extendedAt;
//   final String date;
//   final int addedHours;
//   final double extraAmount;

//   ExtensionHistory({
//     required this.id,
//     required this.extendedAt,
//     required this.date,
//     required this.addedHours,
//     required this.extraAmount,
//   });

//   factory ExtensionHistory.fromJson(Map<String, dynamic> json) {
//     return ExtensionHistory(
//       id: json['_id'] ?? '',
//       extendedAt: json['extendedAt'] ?? '',
//       date: json['date'] ?? '',
//       addedHours: json['addedHours'] ?? 0,
//       extraAmount: (json['extraAmount'] ?? 0).toDouble(),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "extendedAt": extendedAt,
//     "date": date,
//     "addedHours": addedHours,
//     "extraAmount": extraAmount,
//   };
// }

// /// Location model
// class Location {
//   final String type;
//   final List<double> coordinates;

//   Location({required this.type, required this.coordinates});

//   factory Location.fromJson(Map<String, dynamic> json) {
//     return Location(
//       type: json['type'] ?? '',
//       coordinates: (json['coordinates'] as List<dynamic>? ?? [])
//           .map((e) => (e as num).toDouble())
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() => {"type": type, "coordinates": coordinates};
// }

// /// Parent model
// class Parent {
//   final String id;
//   final String name;
//   final String role;
//   final String email;
//   final String profileImage;
//   final String status;
//   final String stripeAccountId;
//   final Location location;
//   final bool verified;
//   final String createdAt;
//   final String updatedAt;
//   final String? countryCode;
//   final bool available;
//   final String address;
//   final String phone;
//   final String dateOfBirth;
//   final String gender;

//   Parent({
//     required this.id,
//     required this.name,
//     required this.role,
//     required this.email,
//     required this.profileImage,
//     required this.status,
//     required this.stripeAccountId,
//     required this.location,
//     required this.verified,
//     required this.createdAt,
//     required this.updatedAt,
//     this.countryCode,
//     required this.available,
//     required this.address,
//     required this.phone,
//     required this.dateOfBirth,
//     required this.gender,
//   });

//   factory Parent.fromJson(Map<String, dynamic> json) {
//     return Parent(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       role: json['role'] ?? '',
//       email: json['email'] ?? '',
//       profileImage: json['profileImage'] ?? '',
//       status: json['status'] ?? '',
//       stripeAccountId: json['stripeAccountId'] ?? '',
//       location: Location.fromJson(json['location'] as Map<String, dynamic>),
//       verified: json['verified'] ?? false,
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//       countryCode: json['countryCode'],
//       available: json['available'] ?? false,
//       address: json['address'] ?? '',
//       phone: json['phone'] ?? '',
//       dateOfBirth: json['dateOfBirth'] ?? '',
//       gender: json['gender'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//     "role": role,
//     "email": email,
//     "profileImage": profileImage,
//     "status": status,
//     "stripeAccountId": stripeAccountId,
//     "location": location.toJson(),
//     "verified": verified,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "countryCode": countryCode,
//     "available": available,
//     "address": address,
//     "phone": phone,
//     "dateOfBirth": dateOfBirth,
//     "gender": gender,
//   };
// }

// /// Nanny model
// class Nanny {
//   final String id;
//   final String name;
//   final String role;
//   final String email;
//   final String profileImage;
//   final String status;
//   final String stripeAccountId;
//   final bool verified;
//   final String createdAt;
//   final String updatedAt;
//   final Location location;
//   final bool available;
//   final String gender;
//   final int kidsManage;
//   final String? address;
//   final String? nannyAbout;
//   final String? dateOfBirth;

//   Nanny({
//     required this.id,
//     required this.name,
//     required this.role,
//     required this.email,
//     required this.profileImage,
//     required this.status,
//     required this.stripeAccountId,
//     required this.verified,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.location,
//     required this.available,
//     required this.gender,
//     required this.kidsManage,
//     this.address,
//     this.nannyAbout,
//     this.dateOfBirth,
//   });

//   factory Nanny.fromJson(Map<String, dynamic> json) {
//     return Nanny(
//       id: json['_id'] ?? '',
//       name: json['name'] ?? '',
//       role: json['role'] ?? '',
//       email: json['email'] ?? '',
//       profileImage: json['profileImage'] ?? '',
//       status: json['status'] ?? '',
//       stripeAccountId: json['stripeAccountId'] ?? '',
//       verified: json['verified'] ?? false,
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//       location: Location.fromJson(json['location'] as Map<String, dynamic>),
//       available: json['available'] ?? false,
//       gender: json['gender'] ?? '',
//       kidsManage: json['kidsManage'] ?? 0,
//       address: json['address'],
//       nannyAbout: json['nannyAbout'],
//       dateOfBirth: json['dateOfBirth'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//     "role": role,
//     "email": email,
//     "profileImage": profileImage,
//     "status": status,
//     "stripeAccountId": stripeAccountId,
//     "verified": verified,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "location": location.toJson(),
//     "available": available,
//     "gender": gender,
//     "kidsManage": kidsManage,
//     "address": address,
//     "nannyAbout": nannyAbout,
//     "dateOfBirth": dateOfBirth,
//   };
// }

// /// Child model
// class Child {
//   final String id;
//   final String userId;
//   final String name;
//   final String dateOfBirth;
//   final String gender;
//   final String childImage;
//   final String createdAt;
//   final String updatedAt;

//   Child({
//     required this.id,
//     required this.userId,
//     required this.name,
//     required this.dateOfBirth,
//     required this.gender,
//     required this.childImage,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Child.fromJson(Map<String, dynamic> json) {
//     return Child(
//       id: json['_id'] ?? '',
//       userId: json['userId'] ?? '',
//       name: json['name'] ?? '',
//       dateOfBirth: json['dateOfBirth'] ?? '',
//       gender: json['gender'] ?? '',
//       childImage: json['childImage'] ?? '',
//       createdAt: json['createdAt'] ?? '',
//       updatedAt: json['updatedAt'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "userId": userId,
//     "name": name,
//     "dateOfBirth": dateOfBirth,
//     "gender": gender,
//     "childImage": childImage,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//   };
// }

// /// Helpers to parse from/to raw JSON string
// NaniBookingAllModel nannyBookingResponseFromJson(String str) =>
//     NaniBookingAllModel.fromJson(json.decode(str) as Map<String, dynamic>);

// String nannyBookingResponseToJson(NaniBookingAllModel data) => json.encode(data.toJson());
