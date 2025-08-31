import 'dart:convert';

/// ----------------------
/// Parsing helpers
/// ----------------------
String _parseString(dynamic v) => v == null ? '' : (v is String ? v : v.toString());
int _parseInt(dynamic v) {
  if (v == null) return 0;
  if (v is int) return v;
  return int.tryParse(v.toString()) ?? 0;
}

double _parseDouble(dynamic v) {
  if (v == null) return 0.0;
  if (v is double) return v;
  if (v is int) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}

bool _parseBool(dynamic v) {
  if (v == null) return false;
  if (v is bool) return v;
  final s = v.toString().toLowerCase();
  return s == 'true' || s == '1' || s == 'yes';
}

List<T> _parseList<T>(dynamic v, T Function(dynamic) mapper) {
  if (v == null) return <T>[];
  if (v is List) return v.map(mapper).toList();
  return <T>[];
}

Map<String, dynamic> _parseMap(dynamic v) {
  if (v == null) return <String, dynamic>{};
  if (v is Map<String, dynamic>) return v;
  if (v is Map) return Map<String, dynamic>.from(v);
  return <String, dynamic>{};
}

/// ----------------------
/// Root response
/// ----------------------
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
      success: _parseBool(json['success']),
      message: _parseString(json['message']),
      statusCode: _parseInt(json['statusCode']),
      data: NaniAllBookingModelData.fromJson(_parseMap(json['data'])),
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'statusCode': statusCode,
    'data': data.toJson(),
  };
}

/// ----------------------
/// Wrapper for data + meta
/// ----------------------
class NaniAllBookingModelData {
  final List<Booking> data;
  final Meta meta;

  NaniAllBookingModelData({required this.data, required this.meta});

  factory NaniAllBookingModelData.fromJson(Map<String, dynamic> json) {
    final dataList = _parseList<Booking>(json['data'], (e) {
      final map = e is Map ? Map<String, dynamic>.from(e) : <String, dynamic>{};
      return Booking.fromJson(map);
    });
    return NaniAllBookingModelData(
      data: dataList,
      meta: Meta.fromJson(_parseMap(json['meta'])),
    );
  }

  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList(),
    'meta': meta.toJson(),
  };
}

/// ----------------------
/// Pagination meta
/// ----------------------
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
      total: _parseInt(json['total']),
      page: _parseInt(json['page']),
      limit: _parseInt(json['limit']),
      totalPages: _parseInt(json['totalPages']),
    );
  }

  Map<String, dynamic> toJson() => {
    'total': total,
    'page': page,
    'limit': limit,
    'totalPages': totalPages,
  };
}

/// ----------------------
/// Booking (main) model
/// ----------------------
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

  /// hourlyBooking is nullable
  final HourlyBooking? hourlyBooking;

  final FullDayBooking? fullDayBooking;

  /// customBooking is ALWAYS a List<CustomBooking> (normalized).
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
    // hourlyBooking (nullable) - expect object with "slots": [...]
    HourlyBooking? parsedHourly;
    if (json['hourlyBooking'] != null && json['hourlyBooking'] is Map) {
      parsedHourly = HourlyBooking.fromJson(_parseMap(json['hourlyBooking']));
    }

    // customBooking - accept list or single object (normalize to list)
    List<CustomBooking> parsedCustomBooking = <CustomBooking>[];
    final cbRaw = json['customBooking'];
    if (cbRaw == null) {
      parsedCustomBooking = <CustomBooking>[];
    } else if (cbRaw is List) {
      parsedCustomBooking = _parseList<CustomBooking>(
        cbRaw,
        (e) => CustomBooking.fromJson(_parseMap(e)),
      );
    } else if (cbRaw is Map) {
      parsedCustomBooking = [CustomBooking.fromJson(Map<String, dynamic>.from(cbRaw))];
    } else {
      parsedCustomBooking = <CustomBooking>[];
    }

    return Booking(
      id: _parseString(json['_id'] ?? json['id']),
      parentId: Parent.fromJson(_parseMap(json['parentId'])),
      nannyId: Nanny.fromJson(_parseMap(json['nannyId'])),
      childrenId: _parseList<Child>(
        json['childrenId'],
        (e) => Child.fromJson(_parseMap(e)),
      ),
      bookingType: _parseString(json['bookingType']),
      bookingStatus: _parseString(json['bookingStatus']),
      serviceRate: json['serviceRate'] != null && json['serviceRate'] is Map
          ? ServiceRate.fromJson(_parseMap(json['serviceRate']))
          : null,
      paymentIntentId: _parseString(json['paymentIntentId']),
      specialInstruction: _parseString(json['specialInstruction']),
      extraBabyCharge: _parseDouble(json['extraBabyCharge']),
      bookedHours: _parseInt(json['bookedHours']),
      hourlyBooking: parsedHourly,
      fullDayBooking: json['fullDayBooking'] != null && json['fullDayBooking'] is Map
          ? FullDayBooking.fromJson(_parseMap(json['fullDayBooking']))
          : null,
      customBooking: parsedCustomBooking,
      totalPayable: _parseDouble(json['totalPayable']),
      paymentStatus: _parseString(json['paymentStatus']),
      paymentId: _parseString(json['paymentId']),
      platformFee: _parseDouble(json['platformFee']),
      nannyEarning: _parseDouble(json['nannyEarning']),
      isCancelledByNanny: _parseBool(json['isCancelledByNanny']),
      isCancelledByParent: _parseBool(json['isCancelledByParent']),
      rescheduleCount: _parseInt(json['rescheduleCount']),
      rescheduleHistory: _parseList<RescheduleHistory>(
        json['rescheduleHistory'],
        (e) => RescheduleHistory.fromJson(
          e is Map ? Map<String, dynamic>.from(e) : <String, dynamic>{},
        ),
      ),
      extensionHistory: _parseList<ExtensionHistory>(
        json['extensionHistory'],
        (e) => ExtensionHistory.fromJson(
          e is Map ? Map<String, dynamic>.from(e) : <String, dynamic>{},
        ),
      ),
      createdAt: _parseString(json['createdAt']),
      updatedAt: _parseString(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'parentId': parentId.toJson(),
    'nannyId': nannyId.toJson(),
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
    'rescheduleHistory': rescheduleHistory.map((e) => e.toJson()).toList(),
    'extensionHistory': extensionHistory.map((e) => e.toJson()).toList(),
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };

  Booking copyWith({
    String? id,
    Parent? parentId,
    Nanny? nannyId,
    List<Child>? childrenId,
    String? bookingType,
    String? bookingStatus,
    ServiceRate? serviceRate,
    String? paymentIntentId,
    String? specialInstruction,
    double? extraBabyCharge,
    int? bookedHours,
    HourlyBooking? hourlyBooking,
    FullDayBooking? fullDayBooking,
    List<CustomBooking>? customBooking,
    double? totalPayable,
    String? paymentStatus,
    String? paymentId,
    double? platformFee,
    double? nannyEarning,
    bool? isCancelledByNanny,
    bool? isCancelledByParent,
    int? rescheduleCount,
    List<RescheduleHistory>? rescheduleHistory,
    List<ExtensionHistory>? extensionHistory,
    String? createdAt,
    String? updatedAt,
  }) {
    return Booking(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      nannyId: nannyId ?? this.nannyId,
      childrenId: childrenId ?? this.childrenId,
      bookingType: bookingType ?? this.bookingType,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      serviceRate: serviceRate ?? this.serviceRate,
      paymentIntentId: paymentIntentId ?? this.paymentIntentId,
      specialInstruction: specialInstruction ?? this.specialInstruction,
      extraBabyCharge: extraBabyCharge ?? this.extraBabyCharge,
      bookedHours: bookedHours ?? this.bookedHours,
      hourlyBooking: hourlyBooking ?? this.hourlyBooking,
      fullDayBooking: fullDayBooking ?? this.fullDayBooking,
      customBooking: customBooking ?? this.customBooking,
      totalPayable: totalPayable ?? this.totalPayable,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentId: paymentId ?? this.paymentId,
      platformFee: platformFee ?? this.platformFee,
      nannyEarning: nannyEarning ?? this.nannyEarning,
      isCancelledByNanny: isCancelledByNanny ?? this.isCancelledByNanny,
      isCancelledByParent: isCancelledByParent ?? this.isCancelledByParent,
      rescheduleCount: rescheduleCount ?? this.rescheduleCount,
      rescheduleHistory: rescheduleHistory ?? this.rescheduleHistory,
      extensionHistory: extensionHistory ?? this.extensionHistory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

/// ----------------------
/// ServiceRate
/// ----------------------
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
    return ServiceRate(
      nannyId: _parseString(json['nannyId']),
      hourlyRate: _parseDouble(json['hourlyRate']),
      dayRate: _parseDouble(json['dayRate']),
      currency: _parseString(json['currency']),
      acceptsOverNight: _parseBool(json['acceptsOverNight']),
      id: _parseString(json['_id'] ?? json['id']),
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

/// ----------------------
/// HourlySlot
/// ----------------------
class HourlySlot {
  final String date;
  final String startTime;
  final int durationInHours;
  final double surcharge;
  final int surchargeHours;

  HourlySlot({
    required this.date,
    required this.startTime,
    required this.durationInHours,
    required this.surcharge,
    required this.surchargeHours,
  });

  factory HourlySlot.fromJson(Map<String, dynamic> json) {
    return HourlySlot(
      date: _parseString(json['date']),
      startTime: _parseString(json['startTime']),
      durationInHours: _parseInt(json['durationInHours']),
      surcharge: _parseDouble(json['surcharge']),
      surchargeHours: _parseInt(json['surchargeHours']),
    );
  }

  Map<String, dynamic> toJson() => {
    'date': date,
    'startTime': startTime,
    'durationInHours': durationInHours,
    'surcharge': surcharge,
    'surchargeHours': surchargeHours,
  };
}

/// ----------------------
/// HourlyBooking
/// ----------------------
class HourlyBooking {
  final List<HourlySlot> slots;

  HourlyBooking({required this.slots});

  factory HourlyBooking.fromJson(Map<String, dynamic> json) {
    final parsedSlots = _parseList<HourlySlot>(json['slots'], (e) {
      final map = e is Map ? Map<String, dynamic>.from(e) : <String, dynamic>{};
      return HourlySlot.fromJson(map);
    });
    return HourlyBooking(slots: parsedSlots);
  }

  Map<String, dynamic> toJson() => {'slots': slots.map((e) => e.toJson()).toList()};
}

/// ----------------------
/// FullDayBooking
/// ----------------------
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
      startDate: json['startDate'] != null ? _parseString(json['startDate']) : null,
      endDate: json['endDate'] != null ? _parseString(json['endDate']) : null,
      fullDays: _parseList<String>(json['fullDays'], (e) => _parseString(e)),
      hasOverTime: _parseBool(json['hasOverTime']),
      overTimeHours: _parseInt(json['overTimeHours']),
    );
  }

  Map<String, dynamic> toJson() => {
    'startDate': startDate,
    'endDate': endDate,
    'fullDays': fullDays,
    'hasOverTime': hasOverTime,
    'overTimeHours': overTimeHours,
  };
}

/// ----------------------
/// CustomBooking (list item)
/// ----------------------
class CustomBooking {
  final String id;
  final String? startDate;
  final String? endDate;
  final List<String> fullDays;

  CustomBooking({required this.id, this.startDate, this.endDate, required this.fullDays});

  factory CustomBooking.fromJson(Map<String, dynamic> json) {
    return CustomBooking(
      id: _parseString(json['_id'] ?? json['id']),
      startDate: json['startDate'] != null ? _parseString(json['startDate']) : null,
      endDate: json['endDate'] != null ? _parseString(json['endDate']) : null,
      fullDays: _parseList<String>(json['fullDays'], (e) => _parseString(e)),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    if (startDate != null) 'startDate': startDate,
    if (endDate != null) 'endDate': endDate,
    'fullDays': fullDays,
  };
}

/// ----------------------
/// ExtensionHistory
/// ----------------------
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
    return ExtensionHistory(
      id: _parseString(json['_id'] ?? json['id']),
      extendedAt: _parseString(json['extendedAt']),
      date: _parseString(json['date']),
      addedHours: _parseInt(json['addedHours']),
      extraAmount: _parseDouble(json['extraAmount']),
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

/// ----------------------
/// RescheduleHistory
/// ----------------------
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
    return RescheduleHistory(
      id: _parseString(json['_id'] ?? json['id']),
      rescheduledAt: _parseString(json['rescheduledAt'] ?? json['rescheduled_at']),
      oldDate: json['oldDate'] != null
          ? _parseString(json['oldDate'])
          : (json['fromDate'] != null ? _parseString(json['fromDate']) : null),
      newDate: json['newDate'] != null
          ? _parseString(json['newDate'])
          : (json['toDate'] != null ? _parseString(json['toDate']) : null),
      reason: json['reason'] != null
          ? _parseString(json['reason'])
          : (json['note'] != null ? _parseString(json['note']) : null),
      createdAt: json['createdAt'] != null ? _parseString(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? _parseString(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'rescheduledAt': rescheduledAt,
    'oldDate': oldDate,
    'newDate': newDate,
    'reason': reason,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

/// ----------------------
/// Location
/// ----------------------
class Location {
  final String type;
  final List<double> coordinates;

  Location({required this.type, required this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: _parseString(json['type']),
      coordinates: _parseList<double>(json['coordinates'], (e) {
        if (e == null) return 0.0;
        if (e is double) return e;
        if (e is int) return e.toDouble();
        return double.tryParse(e.toString()) ?? 0.0;
      }),
    );
  }

  Map<String, dynamic> toJson() => {'type': type, 'coordinates': coordinates};
}

/// ----------------------
/// Parent
/// ----------------------
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
      id: _parseString(json['_id'] ?? json['id']),
      name: _parseString(json['name']),
      role: _parseString(json['role']),
      email: _parseString(json['email']),
      profileImage: _parseString(json['profileImage']),
      status: _parseString(json['status']),
      stripeAccountId: _parseString(json['stripeAccountId']),
      location: Location.fromJson(_parseMap(json['location'])),
      verified: _parseBool(json['verified']),
      createdAt: _parseString(json['createdAt']),
      updatedAt: _parseString(json['updatedAt']),
      countryCode: json['countryCode'] != null ? _parseString(json['countryCode']) : null,
      available: _parseBool(json['available']),
      address: _parseString(json['address']),
      phone: _parseString(json['phone']),
      dateOfBirth: _parseString(json['dateOfBirth']),
      gender: _parseString(json['gender']),
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
    'countryCode': countryCode,
    'available': available,
    'address': address,
    'phone': phone,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
  };
}

/// ----------------------
/// Nanny
/// ----------------------
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
      id: _parseString(json['_id'] ?? json['id']),
      name: _parseString(json['name']),
      role: _parseString(json['role']),
      email: _parseString(json['email']),
      profileImage: _parseString(json['profileImage']),
      status: _parseString(json['status']),
      stripeAccountId: _parseString(json['stripeAccountId']),
      verified: _parseBool(json['verified']),
      createdAt: _parseString(json['createdAt']),
      updatedAt: _parseString(json['updatedAt']),
      location: Location.fromJson(_parseMap(json['location'])),
      available: _parseBool(json['available']),
      gender: _parseString(json['gender']),
      kidsManage: _parseInt(json['kidsManage']),
      address: json['address'] != null ? _parseString(json['address']) : null,
      nannyAbout: json['nannyAbout'] != null ? _parseString(json['nannyAbout']) : null,
      dateOfBirth: json['dateOfBirth'] != null ? _parseString(json['dateOfBirth']) : null,
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
    'verified': verified,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'location': location.toJson(),
    'available': available,
    'gender': gender,
    'kidsManage': kidsManage,
    'address': address,
    'nannyAbout': nannyAbout,
    'dateOfBirth': dateOfBirth,
  };
}

/// ----------------------
/// Child
/// ----------------------
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
      id: _parseString(json['_id'] ?? json['id']),
      userId: _parseString(json['userId']),
      name: _parseString(json['name']),
      dateOfBirth: _parseString(json['dateOfBirth']),
      gender: _parseString(json['gender']),
      childImage: _parseString(json['childImage']),
      createdAt: _parseString(json['createdAt']),
      updatedAt: _parseString(json['updatedAt']),
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

/// ----------------------
/// Top-level helpers
/// ----------------------
NaniBookingAllModel nannyBookingResponseFromJson(String str) =>
    NaniBookingAllModel.fromJson(json.decode(str) as Map<String, dynamic>);

String nannyBookingResponseToJson(NaniBookingAllModel data) => json.encode(data.toJson());
