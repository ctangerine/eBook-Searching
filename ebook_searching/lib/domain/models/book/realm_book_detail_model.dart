import 'package:ebook_searching/domain/models/author/realm_author_model.dart';
import 'package:ebook_searching/domain/models/review/realm_review_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

// part 'realm_book_detail_model.realm.dart';

@RealmModel()
class $RealmBookDetailModel {
  @PrimaryKey()
  late int id;

  late List<$RealmAuthorModel> authors;
  late double avgRating;
  late List<String> categories;
  late String description;
  late List<String> genres;
  late String image;
  late String language;
  late int publicationTime;
  late String publisher;
  late int ratingCount;
  late RealmList<$RealmReviewModel> reviews;
  late String title;
  late int totalPages;
  late String uri;
}
