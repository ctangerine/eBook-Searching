import 'package:uuid/uuid.dart';

class UploadFileRequest {
  static const String example = """
  {
    "fileName": "quan.png",
    "bucketName": "ebooks",
    "fileContent": "",
    "contentType": "png"
  }
  """;

  final String fileName;
  final String bucketName;
  final String fileContent;
  final String contentType;

  // Constructor chính
  UploadFileRequest({
    String? fileName,
    this.bucketName = "ebooks",
    required this.fileContent,
    this.contentType = "png",
  }) : fileName = fileName ?? const Uuid().v4();

  // Constructor from JSON
  factory UploadFileRequest.fromJson(Map<String, dynamic> json) {
    return UploadFileRequest(
      fileName: json["fileName"] ?? const Uuid().v4(),
      bucketName: json["bucketName"] ?? "ebooks",
      fileContent: json["fileContent"] ?? "",
      contentType: json["contentType"] ?? "png",
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'bucketName': bucketName,
      'fileContent': fileContent,
      'contentType': contentType,
    };
  }
}
