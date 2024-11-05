import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/genre_api_impl.dart';
import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';
import 'package:ebook_searching/domain/repositories/genre_repository.dart';


class GenreRepositoryImpl extends GenreRepository {
  final GenreImplApi genreApi;

  GenreRepositoryImpl(
      this.genreApi,
      );

  @override
  Future<Either<Failure, GenreResponseModel>> getAllGenre(GenreParam param) async {
    try {
      final result = await genreApi.getAllGenre(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    } catch(e) {
      return Left(ServerFailure('Error with many message: $e', 0));  
    }
  }
}