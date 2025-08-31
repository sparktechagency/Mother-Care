import 'dart:convert';

class MessageGetModel {
  String? id;
  String? chatId;
  dynamic sender;
  String? text;
  List<String>? images;
  bool? read;
  String? type;
  bool? isDeleted;
  bool? isPinned;
  String? createdAt;
  List<dynamic>? reactions;
  String? updatedAt;
  int? v;

  MessageGetModel({
    this.id,
    this.chatId,
    this.sender,
    this.text,
    this.images,
    this.read,
    this.type,
    this.isDeleted,
    this.isPinned,
    this.createdAt,
    this.reactions,
    this.updatedAt,
    this.v,
  });

  factory MessageGetModel.fromRawJson(String str) =>
      MessageGetModel.fromJson(json.decode(str));

  factory MessageGetModel.fromJson(Map<String, dynamic> json) =>
      MessageGetModel(
        id: json["_id"],
        chatId: json["chatId"],
        sender:
            json["sender"] == null
                ? json["sender"] is Map
                    ? Sender.fromJson(json["sender"])
                    : json["sender"]
                : null,
        text: json["text"],
        images:
            json["images"] == null
                ? []
                : List<String>.from(json["images"]!.map((x) => x)),
        read: json["read"],
        type: json["type"],
        isDeleted: json["isDeleted"],
        isPinned: json["isPinned"],
        createdAt: json["createdAt"],
        reactions:
            json["reactions"] == null
                ? []
                : List<dynamic>.from(json["reactions"]!.map((x) => x)),
        updatedAt:
            json["updatedAt"],
        v: json["__v"],
      );
}

class Sender {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImage;

  const Sender({this.id, this.name, this.email, this.profileImage});

  factory Sender.fromRawJson(String str) => Sender.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    profileImage: json["profileImage"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "profileImage": profileImage,
  };
}
