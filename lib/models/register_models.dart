// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.id,
    this.token,
  });

  final int? id;
  final String? token;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["id"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };
}
