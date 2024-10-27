import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  static const String example = """
  "id": "<int>",
  "uri": "<string>",
  "avgRating": "<double>",
  "image": "<base64>",
  "author": "<string>",
  "title": "<string>"
  """;

  int id;
  String uri;
  double avgRating;
  String image;
  AuthorModel author;
  String? title;

  BookModel({
    required this.id,
    required this.uri,
    required this.avgRating,
    required this.image,
    required this.author,
    this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);


}
