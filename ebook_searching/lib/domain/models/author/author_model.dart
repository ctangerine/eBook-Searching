import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  static const String example = """
  "name": "<string>",
  "stageName": "<string>",
  "nationality": "<string>",
  "birthDate": "<string>",
  "birthPlace": "<string>",
  "deathDate": "<string>",
  "website": "<string>",
  "description": "<string>",
  "image": "<string>"
  """;

  String name;
  String? stageName;
  String? nationality;
  String? birthDate;
  String? birthPlace;
  String? deathDate;
  String? website;
  String? description;
  String? image;

  AuthorModel({
    required this.name,
    this.stageName,
    this.nationality,
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.website,
    this.description,
    this.image
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'stageName': stageName,
      'nationality': nationality,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'deathDate': deathDate,
      'website': website,
      'description': description,
      'image': image,
    };
  }
}