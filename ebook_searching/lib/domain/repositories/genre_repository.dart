import 'package:dartz/dartz.dart';
import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';

import '../../core/network/error/Failure.dart';

abstract class GenreRepository {
  Future<Either<Failure, GenreResponseModel>> getAllGenre(GenreParam param);
}
