import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_response_model.g.dart';

@JsonSerializable()
class BookResponseModel {
  List<BookModel> data;
  int limit;
  int numPages;
  int offset;
  int totalItems;
  BookDetailModel bookDetail;
  AuthorModel author;

  BookResponseModel({
    required this.data,
    required this.limit,
    required this.numPages,
    required this.offset,
    required this.totalItems,
    required this.bookDetail,
    required this.author
  });

  factory BookResponseModel.fromJson(Map<String, dynamic> json) => _$BookResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseModelToJson(this);
}
