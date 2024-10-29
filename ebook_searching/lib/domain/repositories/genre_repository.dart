import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';


abstract class GenreRepository {
  Future<Either<Failure, GenreResponseModel>> getAllGenre(GenreParam param);
}
