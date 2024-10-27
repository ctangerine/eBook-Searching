// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      setup: json['setup'] as bool,
      userId: (json['userId'] as num).toInt(),
      email: json['email'] as String,
      username: json['username'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'setup': instance.setup,
      'userId': instance.userId,
      'email': instance.email,
      'username': instance.username,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
    };
