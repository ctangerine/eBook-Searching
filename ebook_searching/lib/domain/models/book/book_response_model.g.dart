// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponseModel _$BookResponseModelFromJson(Map<String, dynamic> json) =>
    BookResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: (json['limit'] as num).toInt(),
      numPages: (json['numPages'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
      bookDetail:
          BookDetailModel.fromJson(json['bookDetail'] as Map<String, dynamic>),
      author: AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookResponseModelToJson(BookResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'limit': instance.limit,
      'numPages': instance.numPages,
      'offset': instance.offset,
      'totalItems': instance.totalItems,
      'bookDetail': instance.bookDetail,
      'author': instance.author,
    };
