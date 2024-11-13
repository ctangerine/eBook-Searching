import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_response_model.g.dart';

@JsonSerializable(includeIfNull: false)
class BookResponseModel {
  @JsonKey(defaultValue: [])
  List<BookModel>? data;
  int? limit;
  int? numPages;
  int? offset;
  int? totalItems;
  BookDetailModel? bookDetail;
  AuthorModel? author;

  BookResponseModel({
    this.data,
    this.limit,
    this.numPages,
    this.offset,
    this.totalItems,
    this.bookDetail,
    this.author,
  });

  factory BookResponseModel.fromJson(Map<String, dynamic> json) {
    return BookResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [], // default to empty list if `data` is null
      limit: json['limit'] as int?,
      numPages: json['numPages'] as int?,
      offset: json['offset'] as int?,
      totalItems: json['totalItems'] as int?,
      bookDetail: json['bookDetail'] != null
          ? BookDetailModel.fromJson(json['bookDetail'] as Map<String, dynamic>)
          : null,
      author: json['author'] != null
          ? AuthorModel.fromJson(json['author'] as Map<String, dynamic>)
          : null,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
      'limit': limit,
      'numPages': numPages,
      'offset': offset,
      'totalItems': totalItems,
      'bookDetail': bookDetail?.toJson(),
      'author': author?.toJson(),
    };
  }

  // copyWith method
  BookResponseModel copyWith({
    List<BookModel>? data,
    int? limit,
    int? numPages,
    int? offset,
    int? totalItems,
    BookDetailModel? bookDetail,
    AuthorModel? author,
  }) {
    return BookResponseModel(
      data: data ?? this.data,
      limit: limit ?? this.limit,
      numPages: numPages ?? this.numPages,
      offset: offset ?? this.offset,
      totalItems: totalItems ?? this.totalItems,
      bookDetail: bookDetail ?? this.bookDetail,
      author: author ?? this.author,
    );
  }
}