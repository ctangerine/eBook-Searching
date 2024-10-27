// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorModel _$AuthorModelFromJson(Map<String, dynamic> json) => AuthorModel(
      name: json['name'] as String,
      stageName: json['stageName'] as String?,
      nationality: json['nationality'] as String?,
      birthDate: json['birthDate'] as String?,
      birthPlace: json['birthPlace'] as String?,
      deathDate: json['deathDate'] as String?,
      website: json['website'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AuthorModelToJson(AuthorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stageName': instance.stageName,
      'nationality': instance.nationality,
      'birthDate': instance.birthDate,
      'birthPlace': instance.birthPlace,
      'deathDate': instance.deathDate,
      'website': instance.website,
      'description': instance.description,
      'image': instance.image,
    };
