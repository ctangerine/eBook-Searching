import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:ebook_searching/domain/models/book/genre.dart';
import 'package:ebook_searching/domain/models/review/review_model.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
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

  static final BookResponseModel bookResponseModelMockData = BookResponseModel (
    data: [
      BookModel(
        id: 1,
        uri: 'abc',
        avgRating: 1.0,
        image: bookCover1,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Washing Machine Heart',
      ),
      BookModel(
        id: 2,
        uri: 'abc',
        avgRating: 2.0,
        image: bookCover2,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Mine all mine',
      ),
      BookModel(
        id: 3,
        uri: 'abc',
        avgRating: 3.0,
        image: bookCover3,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Me and my husband',
      ),
      BookModel(
        id: 4,
        uri: 'abc',
        avgRating: 1.0,
        image: bookCover1,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Washing Machine Heart',
      ),
      BookModel(
        id: 5,
        uri: 'abc',
        avgRating: 2.0,
        image: bookCover2,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Mine all mine',
      ),
      BookModel(
        id: 6,
        uri: 'abc',
        avgRating: 3.0,
        image: bookCover3,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Me and my husband',
      ),
      BookModel(
        id: 7,
        uri: 'abc',
        avgRating: 1.0,
        image: bookCover1,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Washing Machine Heart',
      ),
      BookModel(
        id: 8,
        uri: 'abc',
        avgRating: 2.0,
        image: bookCover2,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Mine all mine',
      ),
      BookModel(
        id: 9,
        uri: 'abc',
        avgRating: 3.0,
        image: bookCover3,
        authors: [
          AuthorModel(name: 'Mitski Miyawaki')
        ],
        title: 'Me and my husband',
      ),
    ],
    limit: 10,
    numPages: 1,
    offset: 0,
    totalItems: 10,
    bookDetail: BookDetailModel(
      authors: [AuthorModel(name: 'Mistki Miyawaki')],
      avgRating: 4.0,
      categories: ['Literature', 'Sci-Life'],
      description: 'A book about love and life, with long description',
      //genres: [Genre(id: 1, name: 'Literature', image: '')],
      genres: ['Literature', 'Sci-Life'],
      id: 1,
      image: bookCover1,
      language: 'English',
      publicationTime: 2019,
      publisher: 'Gaggoo',
      ratingCount: 4,
      reviews: [ReviewModel(image: avatar, reviewer: 'Myself', content: 'Perfect all kill', time: 2024)],
      title: 'Mine all mine',
      totalPages: 203,
      uri: 'abc'
    ),
    author: AuthorModel(name: 'Mitski Miyawaki'),
  );
}