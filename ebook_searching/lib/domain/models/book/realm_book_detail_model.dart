import 'package:realm/realm.dart';

part 'realm_book_detail_model.realm.dart';

@RealmModel()
class _RealmReviewModel {
  @PrimaryKey()
  late int id;

  late String image;
  late String reviewer;
  late String content;
  late int time;

  //copyWith method
  RealmReviewModel copyWith({
    String? image,
    String? reviewer,
    String? content,
    int? time,
  }) {
    return RealmReviewModel(
      id,
      image ?? this.image,
      reviewer ?? this.reviewer,
      content ?? this.content,
      time ?? this.time,
    );
  }
}

@RealmModel()
class _RealmAuthorModel {
  @PrimaryKey()
  late int id;

  late String name;
  late String? stageName;
  late String? nationality;
  late String? birthDate;
  late String? birthPlace;
  late String? deathDate;
  late String? website;
  late String? description;
  late String? image;

  // copyWith method
  RealmAuthorModel copyWith({
    String? name,
    String? stageName,
    String? nationality,
    String? birthDate,
    String? birthPlace,
    String? deathDate,
    String? website,
    String? description,
    String? image,
  }) {
    return RealmAuthorModel(
      id,
      name ?? this.name,
      stageName: stageName ?? this.stageName,
      nationality: nationality ?? this.nationality,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
      deathDate: deathDate ?? this.deathDate,
      website: website ?? this.website,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
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

  //copyWith method
  RealmBookDetailModel copyWith({
    List<_RealmAuthorModel>? authors,
    double? avgRating,
    List<String>? categories,
    String? description,
    List<String>? genres,
    String? image,
    String? language,
    int? publicationTime,
    String? publisher,
    int? ratingCount,
    List<_RealmReviewModel>? reviews,
    String? title,
    int? totalPages,
    String? uri,
  }) {
    return RealmBookDetailModel(
      id,
      avgRating ?? this.avgRating,
      description ?? this.description,
      image ?? this.image,
      language ?? this.language,
      publicationTime ?? this.publicationTime,
      publisher ?? this.publisher,
      ratingCount ?? this.ratingCount,
      title ?? this.title,
      totalPages ?? this.totalPages,
      uri ?? this.uri,
    );
  }
}


@RealmModel()
class _Library {
  @PrimaryKey()
  late final int id;
  late String name;
  late List<_RealmBookDetailModel> books;

  // copyWith method
  Library copyWith({
    int? id,
    String? name,
    List<_RealmBookDetailModel>? books,
  }) {
    return Library(
      id ?? this.id,
      name ?? this.name,
    );
  }
}