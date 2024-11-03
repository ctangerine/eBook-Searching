import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

// part 'realm_author_model.realm.dart';

@RealmModel(ObjectType.embeddedObject)
class $RealmAuthorModel {
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
