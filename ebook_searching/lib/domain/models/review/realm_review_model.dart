import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

// part 'realm_review_model.realm.dart';

@RealmModel(ObjectType.embeddedObject)
class $RealmReviewModel {
  late String image;
  late String reviewer;
  late String content;
  late int time;
}
