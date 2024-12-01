import 'package:flutter/material.dart';

class UpdateProfileRequest {
  static const String example = """
    "fullName": "<string>",
    "gender": "<string>",
    "dateOfBirth": "<string>"
    "avatar": "<base64>"
  """;

  late final String fullName;
  late final String gender;
  late final String dateOfBirth;
  late final String avatar;
  late final int userId;

  UpdateProfileRequest({
    required this.fullName,
    required this.gender,
    required this.dateOfBirth,
    required this.avatar,
    required this.userId,
  });

  UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    gender = json["gender"];
    dateOfBirth = json["dateOfBirth"];
    avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['avatar'] = avatar;
    debugPrint('data: $data');
    return data;
  }
}