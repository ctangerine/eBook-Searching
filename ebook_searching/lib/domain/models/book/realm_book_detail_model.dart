import 'package:ebook_searching/domain/models/author/realm_author_model.dart';
import 'package:ebook_searching/domain/models/review/realm_review_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'realm_book_detail_model.realm.dart';

@RealmModel()
class _RealmReviewModel {
  @PrimaryKey()
  late ObjectId id;

  late String image;
  late String reviewer;
  late String content;
  late int time;
}

@RealmModel()
class _RealmAuthorModel {
  @PrimaryKey()
  late ObjectId id;

  late String name;
  late String? stageName;
  late String? nationality;
  late String? birthDate;
  late String? birthPlace;
  late String? deathDate;
  late String? website;
  late String? description;
  late String? image;
}

@RealmModel()
class _RealmBookDetailModel {
  @PrimaryKey()
  late int id;

  late List<_RealmAuthorModel> authors;
  late double avgRating;
  late List<String> categories;
  late String description;
  late List<String> genres;
  late String image;
  late String language;
  late int publicationTime;
  late String publisher;
  late int ratingCount;
  late List<_RealmReviewModel> reviews;
  late String title;
  late int totalPages;
  late String uri;
}
