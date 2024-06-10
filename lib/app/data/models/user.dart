import 'package:pocketbase/pocketbase.dart';

class User {
  final String? id;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final String? email;
  final String? username;
  final String? name;
  final String? avatar;
  final bool? emailVisibility;
  final DateTime? updated;
  final bool? verified;

  User({
    this.avatar,
    this.collectionId,
    this.collectionName,
    this.created,
    this.email,
    this.emailVisibility,
    this.id,
    this.name,
    this.updated,
    this.username,
    this.verified,
  });

  String get displayName => username ?? name ?? 'User';

  User copyWith({
    String? avatar,
    String? collectionId,
    String? collectionName,
    DateTime? created,
    String? email,
    bool? emailVisibility,
    String? id,
    String? name,
    DateTime? updated,
    String? username,
    bool? verified,
  }) =>
      User(
        avatar: avatar ?? this.avatar,
        collectionId: collectionId ?? this.collectionId,
        collectionName: collectionName ?? this.collectionName,
        created: created ?? this.created,
        email: email ?? this.email,
        emailVisibility: emailVisibility ?? this.emailVisibility,
        id: id ?? this.id,
        name: name ?? this.name,
        updated: updated ?? this.updated,
        username: username ?? this.username,
        verified: verified ?? this.verified,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json["avatar"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        email: json["email"],
        emailVisibility: json["emailVisibility"],
        id: json["id"],
        name: json["name"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        username: json["username"],
        verified: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "email": email,
        "emailVisibility": emailVisibility,
        "id": id,
        "name": name,
        "updated": updated?.toIso8601String(),
        "username": username,
        "verified": verified,
      };

  factory User.fromRecord(RecordModel record) => User.fromJson(record.toJson());
}
