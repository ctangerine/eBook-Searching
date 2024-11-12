import 'package:ebook_searching/domain/models/genre/genre_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_response_model.g.dart';

@JsonSerializable()
class GenreResponseModel {
  static const String example = """
  "data": [
    {
        "name": "<string>",
        "id": "<int>"
    }
  ],
  "limit": "<int>",
  "numPages": "<int>",
  "offset": "<int>",
  "totalItems": "<int>"
  """;

  List<GenreModel> data;
  int limit;
  int numPages;
  int offset;
  int totalItems;

  GenreResponseModel({
    required this.data,
    required this.limit,
    required this.numPages,
    required this.offset,
    required this.totalItems,
});

  factory GenreResponseModel.fromJson(Map<String, dynamic> json) => _$GenreResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseModelToJson(this);
}