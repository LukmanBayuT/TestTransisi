// To parse this JSON data, do
//
//     final detailsUser = detailsUserFromJson(jsonString);

import 'dart:convert';

DetailsUser detailsUserFromJson(String str) =>
    DetailsUser.fromJson(json.decode(str));

String detailsUserToJson(DetailsUser data) => json.encode(data.toJson());

class DetailsUser {
  DetailsUser({
    this.data,
    this.support,
  });

  final Data? data;
  final Support? support;

  factory DetailsUser.fromJson(Map<String, dynamic> json) => DetailsUser(
        data: Data.fromJson(json["data"]),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "support": support!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  final String? url;
  final String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
