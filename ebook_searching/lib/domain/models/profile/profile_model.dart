import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

typedef ProfileResponseModel = ProfileModel;

@JsonSerializable()
class ProfileModel {
  static const String example = """
    "setup": "<boolean>",
    "userId": "<integer>",
    "email": "<string>",
    "username": "<string>",
    "fullName": "<string>",
    "gender": "<string>",
    "dateOfBirth": "<string>"
  """;

  bool setup;
  int userId;
  String email;
  String? username;
  String? fullName;
  String? gender;
  String? dateOfBirth;

  ProfileModel({
    required this.setup,
    required this.userId,
    required this.email,
    this.username,
    this.fullName,
    this.gender,
    this.dateOfBirth
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}