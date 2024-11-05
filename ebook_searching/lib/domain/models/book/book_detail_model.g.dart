// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDetailModel _$BookDetailModelFromJson(Map<String, dynamic> json) =>
    BookDetailModel(
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: (json['id'] as num).toInt(),
      image: json['image'] as String?,
      language: json['language'] as String?,
      publicationTime: (json['publicationTime'] as num?)?.toInt(),
      publisher: json['publisher'] as String?,
      ratingCount: (json['ratingCount'] as num?)?.toInt(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      totalPages: (json['totalPages'] as num?)?.toInt(),
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$BookDetailModelToJson(BookDetailModel instance) =>
    <String, dynamic>{
      'authors': instance.authors,
      'avgRating': instance.avgRating,
      'categories': instance.categories,
      'description': instance.description,
      'genres': instance.genres,
      'id': instance.id,
      'image': instance.image,
      'language': instance.language,
      'publicationTime': instance.publicationTime,
      'publisher': instance.publisher,
      'ratingCount': instance.ratingCount,
      'reviews': instance.reviews,
      'title': instance.title,
      'totalPages': instance.totalPages,
      'uri': instance.uri,
    };
