// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      image: json['image'] as String,
      reviewer: json['reviewer'] as String,
      content: json['content'] as String,
      time: (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'reviewer': instance.reviewer,
      'content': instance.content,
      'time': instance.time,
    };
