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

Map<String, dynamic> _$BookResponseModelToJson(BookResponseModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('limit', instance.limit);
  writeNotNull('numPages', instance.numPages);
  writeNotNull('offset', instance.offset);
  writeNotNull('totalItems', instance.totalItems);
  writeNotNull('bookDetail', instance.bookDetail);
  writeNotNull('author', instance.author);
  return val;
}
