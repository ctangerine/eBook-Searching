// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreResponseModel _$GenreResponseModelFromJson(Map<String, dynamic> json) =>
    GenreResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      limit: (json['limit'] as num).toInt(),
      numpages: (json['numpages'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      totalItems: (json['totalItems'] as num).toInt(),
    );

Map<String, dynamic> _$GenreResponseModelToJson(GenreResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'limit': instance.limit,
      'numpages': instance.numpages,
      'offset': instance.offset,
      'totalItems': instance.totalItems,
    };
