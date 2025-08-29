class GalleryImage {
  final String url;
  final String id;
  final DateTime createdAt;

  GalleryImage({
    this.url = "",
    this.id = "",
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory GalleryImage.fromJson(Map<String, dynamic> json) {
    return GalleryImage(
      url: json['url'] ?? "",
      id: json['_id'] ?? "",
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      '_id': id,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
