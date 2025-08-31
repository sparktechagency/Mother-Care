class ParentBookingListModel {
    String id;
    Parent parentId;
    Nanny nannyId;
    List<Child> childrenId;
    String bookingType;
    String bookingStatus;
    ServiceRate serviceRate;
    String paymentIntentId;
    String specialInstruction;
    double extraBabyCharge;
    int bookedHours;
    HourlyBooking? hourlyBooking; // Nullable HourlyBooking
    FullDayBooking? fullDayBooking; // Nullable FullDayBooking
    CustomBooking customBooking;
    double totalPayable;
    String paymentStatus;
    String paymentId;
    double platformFee;
    double nannyEarning;
    bool isCancelledByNanny;
    bool isCancelledByParent;
    int rescheduleCount;
    double surcharge;
    double surchargeHours;
    List<String> rescheduleHistory;
    List<String> extensionHistory;
    DateTime createdAt;
    DateTime updatedAt;

    ParentBookingListModel({
        this.id = '',
        required this.parentId,
        required this.nannyId,
        this.childrenId = const [],
        this.bookingType = 'HOURLY',
        this.bookingStatus = 'CANCELLED_BY_PARENT',
        required this.serviceRate,
        this.paymentIntentId = '',
        this.specialInstruction = '',
        this.extraBabyCharge = 0.0,
        this.bookedHours = 0,
        this.hourlyBooking,
        this.fullDayBooking,
        required this.customBooking,
        this.totalPayable = 0.0,
        this.paymentStatus = 'PAID',
        this.paymentId = '',
        this.platformFee = 0.0,
        this.nannyEarning = 0.0,
        this.isCancelledByNanny = false,
        this.isCancelledByParent = false,
        this.rescheduleCount = 0,
        this.surcharge = 0.0,
        this.surchargeHours = 0.0,
        this.rescheduleHistory = const [],
        this.extensionHistory = const [],
        required this.createdAt,
        required this.updatedAt,
    });

    factory ParentBookingListModel.fromJson(Map<String, dynamic> json) {
        return ParentBookingListModel(
            id: json['_id'] ?? '',
            parentId: Parent.fromJson(json['parentId']),
            nannyId: Nanny.fromJson(json['nannyId']),
            childrenId: (json['childrenId'] as List)
                .map((childJson) => Child.fromJson(childJson))
                .toList(),
            bookingType: json['bookingType'] ?? 'HOURLY',
            bookingStatus: json['bookingStatus'] ?? 'CANCELLED_BY_PARENT',
            serviceRate: ServiceRate.fromJson(json['serviceRate']),
            paymentIntentId: json['paymentIntentId'] ?? '',
            specialInstruction: json['specialInstruction'] ?? '',
            extraBabyCharge: json['extraBabyCharge']?.toDouble() ?? 0.0,
            bookedHours: json['bookedHours'] ?? 0,
            hourlyBooking: json['hourlyBooking'] != null
                ? HourlyBooking.fromJson(json['hourlyBooking'])
                : null, // HourlyBooking is null if not present
            fullDayBooking: json['fullDayBooking'] != null
                ? FullDayBooking.fromJson(json['fullDayBooking'])
                : null, // FullDayBooking is null if not present
            customBooking: CustomBooking.fromJson(json['customBooking']),
            totalPayable: json['totalPayable']?.toDouble() ?? 0.0,
            paymentStatus: json['paymentStatus'] ?? 'PAID',
            paymentId: json['paymentId'] ?? '',
            platformFee: json['platformFee']?.toDouble() ?? 0.0,
            nannyEarning: json['nannyEarning']?.toDouble() ?? 0.0,
            isCancelledByNanny: json['isCancelledByNanny'] ?? false,
            isCancelledByParent: json['isCancelledByParent'] ?? false,
            rescheduleCount: json['rescheduleCount'] ?? 0,
            surcharge: json['surcharge']?.toDouble() ?? 0.0,
            surchargeHours: json['surchargeHours']?.toDouble() ?? 0.0,
            rescheduleHistory: List<String>.from(json['rescheduleHistory'] ?? []),
            extensionHistory: List<String>.from(json['extensionHistory'] ?? []),
            createdAt: DateTime.parse(json['createdAt'] ?? ''),
            updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
        );
    }
}

class Parent {
    String id;
    String name;
    String role;
    String email;
    String profileImage;
    String status;
    String stripeAccountId;
    Location location;
    bool verified;
    DateTime createdAt;
    DateTime updatedAt;
    bool available;
    String address;
    String phone;
    DateTime dateOfBirth;
    String gender;

    Parent({
        required this.id,
        required this.name,
        required this.role,
        required this.email,
        required this.profileImage,
        required this.status,
        this.stripeAccountId = '',
        required this.location,
        this.verified = true,
        required this.createdAt,
        required this.updatedAt,
        this.available = true,
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
            location: Location.fromJson(json['location']),
            verified: json['verified'] ?? true,
            createdAt: DateTime.parse(json['createdAt']),
            updatedAt: DateTime.parse(json['updatedAt']),
            available: json['available'] ?? true,
            address: json['address'] ?? '',
            phone: json['phone'] ?? '',
            dateOfBirth: _parseDate(json['dateOfBirth']),
            gender: json['gender'] ?? '',
        );
    }

    // Custom date parsing function for DD-MM-YYYY format
    static DateTime _parseDate(String date) {
        try {
            // Attempt to parse the date in DD-MM-YYYY format
            var parts = date.split('-');
            if (parts.length == 3) {
                // Convert to YYYY-MM-DD format and parse
                return DateTime.parse('${parts[2]}-${parts[1]}-${parts[0]}');
            }
        } catch (e) {
            print("Error parsing date: $date");
        }
        return DateTime.now(); // Return current date if the parsing fails
    }
}

class Nanny {
    String id;
    String name;
    String role;
    String email;
    String profileImage;
    String status;
    String stripeAccountId;
    bool verified;
    DateTime createdAt;
    DateTime updatedAt;
    Location location;
    bool available;
    int kidsManage;
    String address;
    String nannyAbout;
    DateTime dateOfBirth;
    String phone;

    Nanny({
        required this.id,
        required this.name,
        required this.role,
        required this.email,
        required this.profileImage,
        required this.status,
        required this.stripeAccountId,
        this.verified = true,
        required this.createdAt,
        required this.updatedAt,
        required this.location,
        this.available = false,
        this.kidsManage = 0,
        required this.address,
        required this.nannyAbout,
        required this.dateOfBirth,
        required this.phone,
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
            verified: json['verified'] ?? true,
            createdAt: DateTime.parse(json['createdAt']),
            updatedAt: DateTime.parse(json['updatedAt']),
            location: Location.fromJson(json['location']),
            available: json['available'] ?? false,
            kidsManage: json['kidsManage'] ?? 0,
            address: json['address'] ?? '',
            nannyAbout: json['nannyAbout'] ?? '',
            dateOfBirth: _parseDate(json['dateOfBirth']),
            phone: json['phone'] ?? '',
        );
    }

    // Custom date parsing function for DD-MM-YYYY format
    static DateTime _parseDate(String date) {
        try {
            // Attempt to parse the date in DD-MM-YYYY format
            var parts = date.split('-');
            if (parts.length == 3) {
                // Convert to YYYY-MM-DD format and parse
                return DateTime.parse('${parts[2]}-${parts[1]}-${parts[0]}');
            }
        } catch (e) {
            print("Error parsing date: $date");
        }
        return DateTime.now(); // Return current date if the parsing fails
    }
}

class Child {
    String id;
    String userId;
    String name;
    DateTime dateOfBirth;
    String gender;
    String childImage;
    DateTime createdAt;
    DateTime updatedAt;

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
            dateOfBirth: _parseDate(json['dateOfBirth']),
            gender: json['gender'] ?? '',
            childImage: json['childImage'] ?? '',
            createdAt: DateTime.parse(json['createdAt'] ?? ''),
            updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
        );
    }

    // Custom date parsing function for DD-MM-YYYY format
    static DateTime _parseDate(String date) {
        try {
            // Attempt to parse the date in DD-MM-YYYY format
            var parts = date.split('-');
            if (parts.length == 3) {
                // Convert to YYYY-MM-DD format and parse
                return DateTime.parse('${parts[2]}-${parts[1]}-${parts[0]}');
            }
        } catch (e) {
            print("Error parsing date: $date");
        }
        return DateTime.now(); // Return current date if the parsing fails
    }
}

class HourlyBooking {
    List<Slot> slots;

    HourlyBooking({this.slots = const []});

    factory HourlyBooking.fromJson(Map<String, dynamic> json) {
        return HourlyBooking(
            slots: json['slots'] != null
                ? (json['slots'] as List).map((slotJson) => Slot.fromJson(slotJson)).toList()
                : [],
        );
    }
}

class FullDayBooking {
    String startDate;
    String endDate;
    List<String> fullDays;

    FullDayBooking({
        this.startDate = '',
        this.endDate = '',
        this.fullDays = const [],
    });

    factory FullDayBooking.fromJson(Map<String, dynamic> json) {
        return FullDayBooking(
            startDate: json['startDate'] ?? '',
            endDate: json['endDate'] ?? '',
            fullDays: List<String>.from(json['fullDays'] ?? []),
        );
    }
}

class CustomBooking {
    List<String> fullDays;

    CustomBooking({
        this.fullDays = const [],
    });

    factory CustomBooking.fromJson(Map<String, dynamic> json) {
        return CustomBooking(
            fullDays: List<String>.from(json['fullDays'] ?? []),
        );
    }
}

class Slot {
    DateTime date;
    String startTime;
    int durationInHours;
    double surcharge;
    int surchargeHours;

    Slot({
        required this.date,
        required this.startTime,
        required this.durationInHours,
        this.surcharge = 0.0,
        this.surchargeHours = 0,
    });

    factory Slot.fromJson(Map<String, dynamic> json) {
        return Slot(
            date: DateTime.parse(json['date']),
            startTime: json['startTime'] ?? '',
            durationInHours: json['durationInHours'] ?? 0,
            surcharge: json['surcharge']?.toDouble() ?? 0.0,
            surchargeHours: json['surchargeHours'] ?? 0,
        );
    }
}

class Location {
    String type;
    List<double> coordinates;

    Location({
        required this.type,
        required this.coordinates,
    });

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            type: json['type'] ?? '',
            coordinates: List<double>.from(json['coordinates'] ?? []),
        );
    }
}

class ServiceRate {
    String nannyId;
    double hourlyRate;
    double dayRate;
    String currency;
    bool acceptsOverNight;
    String id;

    ServiceRate({
        required this.nannyId,
        this.hourlyRate = 50.0,
        this.dayRate = 200.0,
        this.currency = 'USD',
        this.acceptsOverNight = true,
        required this.id,
    });

    factory ServiceRate.fromJson(Map<String, dynamic> json) {
        return ServiceRate(
            nannyId: json['nannyId'] ?? '',
            hourlyRate: json['hourlyRate']?.toDouble() ?? 50.0,
            dayRate: json['dayRate']?.toDouble() ?? 200.0,
            currency: json['currency'] ?? 'USD',
            acceptsOverNight: json['acceptsOverNight'] ?? true,
            id: json['_id'] ?? '',
        );
    }
}
