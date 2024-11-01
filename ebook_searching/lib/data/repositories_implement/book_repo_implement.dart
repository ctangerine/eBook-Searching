import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/book_api_impl.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/domain/repositories/book_repository.dart';


class BookRepositoryImpl extends BooksRepository {
  final BookApiImpl bookApi;

  BookRepositoryImpl(
      this.bookApi,
      );

  @override
  Future<Either<Failure, BookDetailResponseModel>> getBookDetail(int bookId) async {
    try {
      final result = await bookApi.getBookDetail(bookId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, BookResponseModel>> searchBooksByCriteria(SearchBookParam param) async {
    try {
      final result = await bookApi.searchBooksByCriteria(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}