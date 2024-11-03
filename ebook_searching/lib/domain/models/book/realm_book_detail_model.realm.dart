// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_book_detail_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RealmReviewModel extends _RealmReviewModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmReviewModel(
    ObjectId id,
    String image,
    String reviewer,
    String content,
    int time,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'reviewer', reviewer);
    RealmObjectBase.set(this, 'content', content);
    RealmObjectBase.set(this, 'time', time);
  }

  RealmReviewModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  String get reviewer =>
      RealmObjectBase.get<String>(this, 'reviewer') as String;
  @override
  set reviewer(String value) => RealmObjectBase.set(this, 'reviewer', value);

  @override
  String get content => RealmObjectBase.get<String>(this, 'content') as String;
  @override
  set content(String value) => RealmObjectBase.set(this, 'content', value);

  @override
  int get time => RealmObjectBase.get<int>(this, 'time') as int;
  @override
  set time(int value) => RealmObjectBase.set(this, 'time', value);

  @override
  Stream<RealmObjectChanges<RealmReviewModel>> get changes =>
      RealmObjectBase.getChanges<RealmReviewModel>(this);

  @override
  Stream<RealmObjectChanges<RealmReviewModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<RealmReviewModel>(this, keyPaths);

  @override
  RealmReviewModel freeze() =>
      RealmObjectBase.freezeObject<RealmReviewModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'image': image.toEJson(),
      'reviewer': reviewer.toEJson(),
      'content': content.toEJson(),
      'time': time.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmReviewModel value) => value.toEJson();
  static RealmReviewModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'image': EJsonValue image,
        'reviewer': EJsonValue reviewer,
        'content': EJsonValue content,
        'time': EJsonValue time,
      } =>
        RealmReviewModel(
          fromEJson(id),
          fromEJson(image),
          fromEJson(reviewer),
          fromEJson(content),
          fromEJson(time),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmReviewModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, RealmReviewModel, 'RealmReviewModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('reviewer', RealmPropertyType.string),
      SchemaProperty('content', RealmPropertyType.string),
      SchemaProperty('time', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmAuthorModel extends _RealmAuthorModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmAuthorModel(
    ObjectId id,
    String name, {
    String? stageName,
    String? nationality,
    String? birthDate,
    String? birthPlace,
    String? deathDate,
    String? website,
    String? description,
    String? image,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'stageName', stageName);
    RealmObjectBase.set(this, 'nationality', nationality);
    RealmObjectBase.set(this, 'birthDate', birthDate);
    RealmObjectBase.set(this, 'birthPlace', birthPlace);
    RealmObjectBase.set(this, 'deathDate', deathDate);
    RealmObjectBase.set(this, 'website', website);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'image', image);
  }

  RealmAuthorModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get stageName =>
      RealmObjectBase.get<String>(this, 'stageName') as String?;
  @override
  set stageName(String? value) => RealmObjectBase.set(this, 'stageName', value);

  @override
  String? get nationality =>
      RealmObjectBase.get<String>(this, 'nationality') as String?;
  @override
  set nationality(String? value) =>
      RealmObjectBase.set(this, 'nationality', value);

  @override
  String? get birthDate =>
      RealmObjectBase.get<String>(this, 'birthDate') as String?;
  @override
  set birthDate(String? value) => RealmObjectBase.set(this, 'birthDate', value);

  @override
  String? get birthPlace =>
      RealmObjectBase.get<String>(this, 'birthPlace') as String?;
  @override
  set birthPlace(String? value) =>
      RealmObjectBase.set(this, 'birthPlace', value);

  @override
  String? get deathDate =>
      RealmObjectBase.get<String>(this, 'deathDate') as String?;
  @override
  set deathDate(String? value) => RealmObjectBase.set(this, 'deathDate', value);

  @override
  String? get website =>
      RealmObjectBase.get<String>(this, 'website') as String?;
  @override
  set website(String? value) => RealmObjectBase.set(this, 'website', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  Stream<RealmObjectChanges<RealmAuthorModel>> get changes =>
      RealmObjectBase.getChanges<RealmAuthorModel>(this);

  @override
  Stream<RealmObjectChanges<RealmAuthorModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<RealmAuthorModel>(this, keyPaths);

  @override
  RealmAuthorModel freeze() =>
      RealmObjectBase.freezeObject<RealmAuthorModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'stageName': stageName.toEJson(),
      'nationality': nationality.toEJson(),
      'birthDate': birthDate.toEJson(),
      'birthPlace': birthPlace.toEJson(),
      'deathDate': deathDate.toEJson(),
      'website': website.toEJson(),
      'description': description.toEJson(),
      'image': image.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmAuthorModel value) => value.toEJson();
  static RealmAuthorModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
      } =>
        RealmAuthorModel(
          fromEJson(id),
          fromEJson(name),
          stageName: fromEJson(ejson['stageName']),
          nationality: fromEJson(ejson['nationality']),
          birthDate: fromEJson(ejson['birthDate']),
          birthPlace: fromEJson(ejson['birthPlace']),
          deathDate: fromEJson(ejson['deathDate']),
          website: fromEJson(ejson['website']),
          description: fromEJson(ejson['description']),
          image: fromEJson(ejson['image']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmAuthorModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, RealmAuthorModel, 'RealmAuthorModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('stageName', RealmPropertyType.string, optional: true),
      SchemaProperty('nationality', RealmPropertyType.string, optional: true),
      SchemaProperty('birthDate', RealmPropertyType.string, optional: true),
      SchemaProperty('birthPlace', RealmPropertyType.string, optional: true),
      SchemaProperty('deathDate', RealmPropertyType.string, optional: true),
      SchemaProperty('website', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class RealmBookDetailModel extends _RealmBookDetailModel
    with RealmEntity, RealmObjectBase, RealmObject {
  RealmBookDetailModel(
    int id,
    double avgRating,
    String description,
    String image,
    String language,
    int publicationTime,
    String publisher,
    int ratingCount,
    String title,
    int totalPages,
    String uri, {
    Iterable<RealmAuthorModel> authors = const [],
    Iterable<String> categories = const [],
    Iterable<String> genres = const [],
    Iterable<RealmReviewModel> reviews = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set<RealmList<RealmAuthorModel>>(
        this, 'authors', RealmList<RealmAuthorModel>(authors));
    RealmObjectBase.set(this, 'avgRating', avgRating);
    RealmObjectBase.set<RealmList<String>>(
        this, 'categories', RealmList<String>(categories));
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<String>>(
        this, 'genres', RealmList<String>(genres));
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'language', language);
    RealmObjectBase.set(this, 'publicationTime', publicationTime);
    RealmObjectBase.set(this, 'publisher', publisher);
    RealmObjectBase.set(this, 'ratingCount', ratingCount);
    RealmObjectBase.set<RealmList<RealmReviewModel>>(
        this, 'reviews', RealmList<RealmReviewModel>(reviews));
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'totalPages', totalPages);
    RealmObjectBase.set(this, 'uri', uri);
  }

  RealmBookDetailModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  RealmList<RealmAuthorModel> get authors =>
      RealmObjectBase.get<RealmAuthorModel>(this, 'authors')
          as RealmList<RealmAuthorModel>;
  @override
  set authors(covariant RealmList<RealmAuthorModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  double get avgRating =>
      RealmObjectBase.get<double>(this, 'avgRating') as double;
  @override
  set avgRating(double value) => RealmObjectBase.set(this, 'avgRating', value);

  @override
  RealmList<String> get categories =>
      RealmObjectBase.get<String>(this, 'categories') as RealmList<String>;
  @override
  set categories(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<String> get genres =>
      RealmObjectBase.get<String>(this, 'genres') as RealmList<String>;
  @override
  set genres(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get image => RealmObjectBase.get<String>(this, 'image') as String;
  @override
  set image(String value) => RealmObjectBase.set(this, 'image', value);

  @override
  String get language =>
      RealmObjectBase.get<String>(this, 'language') as String;
  @override
  set language(String value) => RealmObjectBase.set(this, 'language', value);

  @override
  int get publicationTime =>
      RealmObjectBase.get<int>(this, 'publicationTime') as int;
  @override
  set publicationTime(int value) =>
      RealmObjectBase.set(this, 'publicationTime', value);

  @override
  String get publisher =>
      RealmObjectBase.get<String>(this, 'publisher') as String;
  @override
  set publisher(String value) => RealmObjectBase.set(this, 'publisher', value);

  @override
  int get ratingCount => RealmObjectBase.get<int>(this, 'ratingCount') as int;
  @override
  set ratingCount(int value) => RealmObjectBase.set(this, 'ratingCount', value);

  @override
  RealmList<RealmReviewModel> get reviews =>
      RealmObjectBase.get<RealmReviewModel>(this, 'reviews')
          as RealmList<RealmReviewModel>;
  @override
  set reviews(covariant RealmList<RealmReviewModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  int get totalPages => RealmObjectBase.get<int>(this, 'totalPages') as int;
  @override
  set totalPages(int value) => RealmObjectBase.set(this, 'totalPages', value);

  @override
  String get uri => RealmObjectBase.get<String>(this, 'uri') as String;
  @override
  set uri(String value) => RealmObjectBase.set(this, 'uri', value);

  @override
  Stream<RealmObjectChanges<RealmBookDetailModel>> get changes =>
      RealmObjectBase.getChanges<RealmBookDetailModel>(this);

  @override
  Stream<RealmObjectChanges<RealmBookDetailModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<RealmBookDetailModel>(this, keyPaths);

  @override
  RealmBookDetailModel freeze() =>
      RealmObjectBase.freezeObject<RealmBookDetailModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'authors': authors.toEJson(),
      'avgRating': avgRating.toEJson(),
      'categories': categories.toEJson(),
      'description': description.toEJson(),
      'genres': genres.toEJson(),
      'image': image.toEJson(),
      'language': language.toEJson(),
      'publicationTime': publicationTime.toEJson(),
      'publisher': publisher.toEJson(),
      'ratingCount': ratingCount.toEJson(),
      'reviews': reviews.toEJson(),
      'title': title.toEJson(),
      'totalPages': totalPages.toEJson(),
      'uri': uri.toEJson(),
    };
  }

  static EJsonValue _toEJson(RealmBookDetailModel value) => value.toEJson();
  static RealmBookDetailModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'avgRating': EJsonValue avgRating,
        'description': EJsonValue description,
        'image': EJsonValue image,
        'language': EJsonValue language,
        'publicationTime': EJsonValue publicationTime,
        'publisher': EJsonValue publisher,
        'ratingCount': EJsonValue ratingCount,
        'title': EJsonValue title,
        'totalPages': EJsonValue totalPages,
        'uri': EJsonValue uri,
      } =>
        RealmBookDetailModel(
          fromEJson(id),
          fromEJson(avgRating),
          fromEJson(description),
          fromEJson(image),
          fromEJson(language),
          fromEJson(publicationTime),
          fromEJson(publisher),
          fromEJson(ratingCount),
          fromEJson(title),
          fromEJson(totalPages),
          fromEJson(uri),
          authors: fromEJson(ejson['authors']),
          categories: fromEJson(ejson['categories']),
          genres: fromEJson(ejson['genres']),
          reviews: fromEJson(ejson['reviews']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(RealmBookDetailModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, RealmBookDetailModel, 'RealmBookDetailModel', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('authors', RealmPropertyType.object,
          linkTarget: 'RealmAuthorModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('avgRating', RealmPropertyType.double),
      SchemaProperty('categories', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('genres', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('image', RealmPropertyType.string),
      SchemaProperty('language', RealmPropertyType.string),
      SchemaProperty('publicationTime', RealmPropertyType.int),
      SchemaProperty('publisher', RealmPropertyType.string),
      SchemaProperty('ratingCount', RealmPropertyType.int),
      SchemaProperty('reviews', RealmPropertyType.object,
          linkTarget: 'RealmReviewModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('totalPages', RealmPropertyType.int),
      SchemaProperty('uri', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
