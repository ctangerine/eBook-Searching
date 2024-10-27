import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authen_model.g.dart';

@JsonSerializable()
class AuthenModel {
  static const String example = """
    "profile": {
      "setup": "<boolean>",
      "userId": "<integer>",
      "email": "<string>",
      "username": "<string>",
      "fullName": "<string>",
      "gender": "<string>",
      "dateOfBirth": "<string>"
    },
    "accessToken": "<string>",
    "expirationTimestamp": "<integer>"
  """;

  ProfileModel profile;
  String accessToken;
  int expirationTimestamp;

  AuthenModel({
    required this.profile,
    required this.accessToken,
    required this.expirationTimestamp
  });

  factory AuthenModel.fromJson(Map<String, dynamic> json) => _$AuthenModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenModelToJson(this);
}