import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';

abstract class GenreApi {
  Future<GenreResponseModel> getAllGenre(GenreParam param);
}
