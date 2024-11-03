import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/review/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_detail_model.g.dart';

typedef BookDetailResponseModel = BookDetailModel;

@JsonSerializable()
class BookDetailModel {
  static const String example = """
  "author": [
    {
      "name": "<string>",
      "stageName": "<string>",
      "nationality": "<string>",
      "birthDate": "<string>",
      "birthPlace": "<string>",
      "deathDate": "<string>",
      "website": "<string>",
      "description": "<string>",
      "image": "<string>"
    }
  ],
  "avgRating": "<double>",
  "categories": [
    "<string>",
    "<string>"
  ],
  "description": "<string>",
  "genres": [
    "<string>",
    "<string>"
  ],
  "id": "<int>",
  "image": "<base64>",
  "language": "<string>",
  "publicationTime": "<int>",
  "publisher": "<string>",
  "ratingCount": "<int>",
  "reviews": [
    {
      "image": "<base64>",
      "reviewer": "<string>",
      "content": "<string>",
      "time": "<int>"
    }
  ],
  "title": "<string>",
  "totalPages": "<int>",
  "uri": "<string>"
  """;

  List<AuthorModel> authors;
  double avgRating;
  List<String> categories;
  String description;
  List<String> genres;
  int id;
  String image;
  String language;
  int publicationTime;
  String publisher;
  int ratingCount;
  List<ReviewModel> reviews;
  String title;
  int totalPages;
  String uri;

  BookDetailModel(
      {required this.authors,
      required this.avgRating,
      required this.categories,
      required this.description,
      required this.genres,
      required this.id,
      required this.image,
      required this.language,
      required this.publicationTime,
      required this.publisher,
      required this.ratingCount,
      required this.reviews,
      required this.title,
      required this.totalPages,
      required this.uri});

  // copyWith method
  BookDetailModel copyWith({
    List<AuthorModel>? authors,
    double? avgRating,
    List<String>? categories,
    String? description,
    List<String>? genres,
    int? id,
    String? image,
    String? language,
    int? publicationTime,
    String? publisher,
    int? ratingCount,
    List<ReviewModel>? reviews,
    String? title,
    int? totalPages,
    String? uri,
  }) {
    return BookDetailModel(
      authors: authors ?? this.authors,
      avgRating: avgRating ?? this.avgRating,
      categories: categories ?? this.categories,
      description: description ?? this.description,
      genres: genres ?? this.genres,
      id: id ?? this.id,
      image: image ?? this.image,
      language: language ?? this.language,
      publicationTime: publicationTime ?? this.publicationTime,
      publisher: publisher ?? this.publisher,
      ratingCount: ratingCount ?? this.ratingCount,
      reviews: reviews ?? this.reviews,
      title: title ?? this.title,
      totalPages: totalPages ?? this.totalPages,
      uri: uri ?? this.uri,
    );
  }

  factory BookDetailModel.fromJson(Map<String, dynamic> json) => _$BookDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookDetailModelToJson(this);
}
