import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import 'project.dart';
import 'user.dart';

class Task {
  final String? author;
  final String? collectionId;
  final String? collectionName;
  final DateTime? created;
  final TaskExpand? expand;
  final String? id;
  final bool? isDone;
  final String? project;
  final String? summary;
  final DateTime? updated;

  Task({
    this.author,
    this.collectionId,
    this.collectionName,
    this.created,
    this.expand,
    this.id,
    this.isDone,
    this.project,
    this.summary,
    this.updated,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        author: json["author"],
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        expand:
            json["expand"] == null ? null : TaskExpand.fromJson(json["expand"]),
        id: json["id"],
        isDone: json["is_done"],
        project: json["project"],
        summary: json["summary"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created?.toIso8601String(),
        "expand": expand?.toJson(),
        "id": id,
        "is_done": isDone,
        "project": project,
        "summary": summary,
        "updated": updated?.toIso8601String(),
      };

  factory Task.fromRecord(RecordModel record) => Task.fromJson(record.toJson());
}

class TaskExpand {
  final User? author;
  final Project? project;

  TaskExpand({
    this.author,
    this.project,
  });

  factory TaskExpand.fromRawJson(String str) =>
      TaskExpand.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskExpand.fromJson(Map<String, dynamic> json) => TaskExpand(
        author: json["author"] == null ? null : User.fromJson(json["author"]),
        project:
            json["project"] == null ? null : Project.fromJson(json["project"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author?.toJson(),
        "project": project?.toJson(),
      };
}
