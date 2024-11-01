import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/usecase/usecase.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';
import 'package:ebook_searching/domain/repositories/genre_repository.dart';


class GetAllGenreUseCase extends UseCase<GenreResponseModel, GenreParam> {
  final GenreRepository repository;

  GetAllGenreUseCase(this.repository);

  @override
  Future<Either<Failure, GenreResponseModel>> call(GenreParam param) {
    return repository.getAllGenre(param);
  }
}
