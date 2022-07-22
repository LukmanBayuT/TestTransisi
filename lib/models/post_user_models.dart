// To parse this JSON data, do
//
//     final postUser = postUserFromJson(jsonString);

import 'dart:convert';

PostUser postUserFromJson(String str) => PostUser.fromJson(json.decode(str));

String postUserToJson(PostUser data) => json.encode(data.toJson());

class PostUser {
  PostUser({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  final String? name;
  final String? job;
  final String? id;
  final DateTime? createdAt;

  factory PostUser.fromJson(Map<String, dynamic> json) => PostUser(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt!.toIso8601String(),
      };
}
