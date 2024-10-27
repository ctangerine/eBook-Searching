// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenModel _$AuthenModelFromJson(Map<String, dynamic> json) => AuthenModel(
      profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      expirationTimestamp: (json['expirationTimestamp'] as num).toInt(),
    );

Map<String, dynamic> _$AuthenModelToJson(AuthenModel instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'accessToken': instance.accessToken,
      'expirationTimestamp': instance.expirationTimestamp,
    };
