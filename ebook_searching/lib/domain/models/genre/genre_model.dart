import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  static const String example = """
  "name": "<string>",
  "id": "<int>"
  """;

  String name;
  int id;

  GenreModel({
    required this.name,
    required this.id
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);
  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}