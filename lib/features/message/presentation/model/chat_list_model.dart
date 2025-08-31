import 'dart:convert';

class ChatListModel {
    String? id;
    List<Participant>? participants;
    LastMessage? lastMessage;
    String? status;
    bool? isDeleted;
    List<dynamic>? deletedBy;
    List<String>? readBy;
    List<dynamic>? mutedBy;
    List<dynamic>? pinnedMessages;
    List<dynamic>? blockedUsers;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    bool? isRead;
    int? unreadCount;
    bool? isMuted;
    bool? isBlocked;

    ChatListModel({
        this.id,
        this.participants,
        this.lastMessage,
        this.status,
        this.isDeleted,
        this.deletedBy,
        this.readBy,
        this.mutedBy,
        this.pinnedMessages,
        this.blockedUsers,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.isRead,
        this.unreadCount,
        this.isMuted,
        this.isBlocked,
    });

    factory ChatListModel.fromRawJson(String str) => ChatListModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        id: json["_id"],
        participants: json["participants"] == null ? [] : List<Participant>.from(json["participants"]!.map((x) => Participant.fromJson(x))),
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
        status: json["status"],
        isDeleted: json["isDeleted"],
        deletedBy: json["deletedBy"] == null ? [] : List<dynamic>.from(json["deletedBy"]!.map((x) => x)),
        readBy: json["readBy"] == null ? [] : List<String>.from(json["readBy"]!.map((x) => x)),
        mutedBy: json["mutedBy"] == null ? [] : List<dynamic>.from(json["mutedBy"]!.map((x) => x)),
        pinnedMessages: json["pinnedMessages"] == null ? [] : List<dynamic>.from(json["pinnedMessages"]!.map((x) => x)),
        blockedUsers: json["blockedUsers"] == null ? [] : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        isRead: json["isRead"],
        unreadCount: json["unreadCount"],
        isMuted: json["isMuted"],
        isBlocked: json["isBlocked"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x.toJson())),
        "lastMessage": lastMessage?.toJson(),
        "status": status,
        "isDeleted": isDeleted,
        "deletedBy": deletedBy == null ? [] : List<dynamic>.from(deletedBy!.map((x) => x)),
        "readBy": readBy == null ? [] : List<dynamic>.from(readBy!.map((x) => x)),
        "mutedBy": mutedBy == null ? [] : List<dynamic>.from(mutedBy!.map((x) => x)),
        "pinnedMessages": pinnedMessages == null ? [] : List<dynamic>.from(pinnedMessages!.map((x) => x)),
        "blockedUsers": blockedUsers == null ? [] : List<dynamic>.from(blockedUsers!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "isRead": isRead,
        "unreadCount": unreadCount,
        "isMuted": isMuted,
        "isBlocked": isBlocked,
    };
}

class LastMessage {
    String? id;
    String? chatId;
    String? sender;
    String? text;
    List<dynamic>? images;
    bool? read;
    String? type;
    bool? isDeleted;
    bool? isPinned;
    DateTime? createdAt;
    List<dynamic>? reactions;
    DateTime? updatedAt;
    int? v;

    LastMessage({
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

    factory LastMessage.fromRawJson(String str) => LastMessage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        id: json["_id"],
        chatId: json["chatId"],
        sender: json["sender"],
        text: json["text"],
        images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
        read: json["read"],
        type: json["type"],
        isDeleted: json["isDeleted"],
        isPinned: json["isPinned"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        reactions: json["reactions"] == null ? [] : List<dynamic>.from(json["reactions"]!.map((x) => x)),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chatId": chatId,
        "sender": sender,
        "text": text,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "read": read,
        "type": type,
        "isDeleted": isDeleted,
        "isPinned": isPinned,
        "createdAt": createdAt?.toIso8601String(),
        "reactions": reactions == null ? [] : List<dynamic>.from(reactions!.map((x) => x)),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Participant {
    String? id;
    String? name;
    String? email;
    String? profileImage;

    Participant({
        this.id,
        this.name,
        this.email,
        this.profileImage,
    });

    factory Participant.fromRawJson(String str) => Participant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Participant.fromJson(Map<String, dynamic> json) => Participant(
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
