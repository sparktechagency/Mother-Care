import 'dart:convert';

class NotificationModel {
    String? id;
    String? title;
    String? message;
    String? receiver;
    String? sender;
    bool? read;
    String? type;
    String? createdAt;
    String? updatedAt;

    NotificationModel({
        this.id,
        this.title,
        this.message,
        this.receiver,
        this.sender,
        this.read,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    factory NotificationModel.fromRawJson(String str) => NotificationModel.fromJson(json.decode(str));



    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json["_id"],
        title: json["title"],
        message: json["message"],
        receiver: json["receiver"],
        sender: json["sender"],
        read: json["read"],
        type: json["type"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"] ,
    );

   
}
