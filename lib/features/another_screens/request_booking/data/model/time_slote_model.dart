class TimeSlote {
  String startTime;
  bool isBooked;
  bool isAvailable;
  bool isSelected;


  TimeSlote({
    this.startTime = "08:00",
    this.isBooked = false,
    this.isSelected = false,
    this.isAvailable = true,
  });

  factory TimeSlote.fromJson(Map<String, dynamic> json) {
    return TimeSlote(
      startTime: json['startTime'] ?? "08:00",
      isBooked: json['isBooked'] ?? false,
      isAvailable: json['isAvailable'] ?? true,
    );
  }
}
