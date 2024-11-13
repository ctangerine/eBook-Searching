import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  static const String template = """
  "image": "<base64>",
  "reviewer": "<string>",
  "content": "<string>",
  "time": "<int>"
  """;

  String image;
  String reviewer;
  String content;
  int time;

  ReviewModel({
    required this.image,
    required this.reviewer,
    required this.content,
    required this.time
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'reviewer': reviewer,
      'content': content,
      'time': time,
    };
  }
}