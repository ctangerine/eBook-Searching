import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/review/review_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_detail_model.g.dart';

typedef BookDetailResponseModel = BookDetailModel;

@JsonSerializable()
class BookDetailModel {
  List<AuthorModel>? authors;
  double? avgRating;
  List<String>? categories;
  String? description;
  List<String>? genres;
  int id;
  String? image;
  String? language;
  int? publicationTime;
  String? publisher;
  int? ratingCount;
  List<ReviewModel>? reviews;
  String? title;
  int? totalPages;
  String? uri;

  BookDetailModel({
    this.authors,
    this.avgRating,
    this.categories,
    this.description,
    this.genres,
    required this.id,
    this.image,
    this.language,
    this.publicationTime,
    this.publisher,
    this.ratingCount,
    this.reviews,
    this.title,
    this.totalPages,
    this.uri,
  });

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

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    return BookDetailModel(
      authors: (json['authors'] as List<dynamic>?)
          ?.map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      avgRating: (json['avgRating'] as num?)?.toDouble(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      genres: [], // Ignore the genres part in JSON and return an empty list
      id: json['id'] as int,
      image: json['image'] as String?,
      language: json['language'] as String?,
      publicationTime: json['publicationTime'] as int?,
      publisher: json['publisher'] as String?,
      ratingCount: json['ratingCount'] as int?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      totalPages: json['totalPages'] as int?,
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authors': authors?.map((e) => e.toJson()).toList(),
      'avgRating': avgRating,
      'categories': categories,
      'description': description,
      'genres': genres,
      'id': id,
      'image': image,
      'language': language,
      'publicationTime': publicationTime,
      'publisher': publisher,
      'ratingCount': ratingCount,
      'reviews': reviews?.map((e) => e.toJson()).toList(),
      'title': title,
      'totalPages': totalPages,
      'uri': uri,
    };
  }
}