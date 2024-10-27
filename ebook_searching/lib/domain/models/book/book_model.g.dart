// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: (json['id'] as num).toInt(),
      uri: json['uri'] as String,
      avgRating: (json['avgRating'] as num).toDouble(),
      image: json['image'] as String,
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'uri': instance.uri,
      'avgRating': instance.avgRating,
      'image': instance.image,
      'author': instance.author,
      'title': instance.title,
    };
