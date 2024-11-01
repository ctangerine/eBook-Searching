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
      authors: (json['authors'] as List<dynamic>)
          .map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'uri': instance.uri,
      'avgRating': instance.avgRating,
      'image': instance.image,
      'authors': instance.authors,
      'title': instance.title,
    };
