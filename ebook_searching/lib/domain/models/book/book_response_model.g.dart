// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponseModel _$BookResponseModelFromJson(Map<String, dynamic> json) =>
    BookResponseModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      limit: (json['limit'] as num?)?.toInt(),
      numPages: (json['numPages'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      totalItems: (json['totalItems'] as num?)?.toInt(),
      bookDetail: json['bookDetail'] == null
          ? null
          : BookDetailModel.fromJson(
              json['bookDetail'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : AuthorModel.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookResponseModelToJson(BookResponseModel instance) =>
    <String, dynamic>{
      if (instance.data case final value?) 'data': value,
      if (instance.limit case final value?) 'limit': value,
      if (instance.numPages case final value?) 'numPages': value,
      if (instance.offset case final value?) 'offset': value,
      if (instance.totalItems case final value?) 'totalItems': value,
      if (instance.bookDetail case final value?) 'bookDetail': value,
      if (instance.author case final value?) 'author': value,
    };
