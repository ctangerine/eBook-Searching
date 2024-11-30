import 'package:json_annotation/json_annotation.dart';

part 'upload_file_model.g.dart';

@JsonSerializable()
class UploadFileModel {
  static const String example = """
    "id": null,
    "fileName": null,
    "filePath": "ebooks/quan.png",
    "contentType": null,
    "size": null,
    "createdAt": null
  """;

  String? id;
  String? fileName;
  String filePath;
  String? contentType;
  String? size;
  String? createdAt;

  UploadFileModel({
    required this.filePath
  });

  factory UploadFileModel.fromJson(Map<String, dynamic> json) => _$UploadFileModelFromJson(json);
  Map<String, dynamic> toJson() => _$UploadFileModelToJson(this);
}