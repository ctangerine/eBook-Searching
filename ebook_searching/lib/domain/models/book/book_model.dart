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
  "author": [],
  "title": "<string>"
  """;

  int id;
  String? uri;
  double? avgRating;
  String? image;
  List<AuthorModel>? authors;
  String? title;

  BookModel({
    required this.id,
    this.uri,
    this.avgRating,
    this.image,
    this.authors,
    this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uri': uri,
      'avgRating': avgRating,
      'image': image,
      'authors': authors?.map((e) => e.toJson()).toList(),
      'title': title,
    };
  }


}
