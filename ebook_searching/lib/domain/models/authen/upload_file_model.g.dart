// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileModel _$UploadFileModelFromJson(Map<String, dynamic> json) =>
    UploadFileModel(
      filePath: json['filePath'] as String,
    )
      ..id = json['id'] as String?
      ..fileName = json['fileName'] as String?
      ..contentType = json['contentType'] as String?
      ..size = json['size'] as String?
      ..createdAt = json['createdAt'] as String?;

Map<String, dynamic> _$UploadFileModelToJson(UploadFileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'contentType': instance.contentType,
      'size': instance.size,
      'createdAt': instance.createdAt,
    };
