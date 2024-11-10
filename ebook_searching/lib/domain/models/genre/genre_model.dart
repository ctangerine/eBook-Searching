import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  static const String example = """
  "name": "<string>",
  "id": "<int>"
  "image": "<String>"
  """;

  String name;
  int id;
  String image;

  GenreModel({
    required this.name,
    required this.id,
    required this.image
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}