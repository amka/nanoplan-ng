import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import 'user.dart';

class Project {
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final String? description;
  final ProjectExpand? expand;
  final String? id;
  final String? owner;
  final String? title;
  final DateTime? updated;

  Project({
    this.collectionId,
    this.collectionName,
    this.created,
    this.description,
    this.expand,
    this.id,
    this.owner,
    this.title,
    this.updated,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        description: json["description"],
        expand: json["expand"] == null
            ? null
            : ProjectExpand.fromJson(json["expand"]),
        id: json["id"],
        owner: json["owner"],
        title: json["title"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "description": description,
        "expand": expand?.toJson(),
        "id": id,
        "owner": owner,
        "title": title,
        "updated": updated?.toIso8601String(),
      };

  factory Project.fromRecord(RecordModel record) =>
      Project.fromJson(record.toJson());
}

class ProjectExpand {
  final User? owner;

  ProjectExpand({
    this.owner,
  });

  factory ProjectExpand.fromRawJson(String str) =>
      ProjectExpand.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProjectExpand.fromJson(Map<String, dynamic> json) => ProjectExpand(
        owner: json["owner"] == null ? null : User.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "owner": owner?.toJson(),
      };
}
