import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/local_datasource/book_storage_impl.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/book_api_impl.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/domain/repositories/book_repository.dart';
import 'package:realm/realm.dart';


class BookRepositoryImpl extends BooksRepository {
  final BookApiImpl bookApi;
  final BookStorageImpl bookStorage;

  BookRepositoryImpl(
      this.bookApi,
      this.bookStorage
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
    } catch (e) {
      return Left(ServerFailure('Currently can\'t load any books: $e', 0));
    }
  }

  @override
  Future<Either<Failure, void>> addBook(RealmBookDetailModel book) async {
    try {
      await bookStorage.addBook(book);
      return const Right(null); // Return void result on success
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBook(int id) async {
    try {
      await bookStorage.deleteBook(id);
      return const Right(null); // Return void result on success
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<RealmBookDetailModel>>> getAllBooks() async {
    try {
      final result = await bookStorage.getAllBooks();
      return Right(result);
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, RealmBookDetailModel?>> getBookById(int id) async {
    try {
      final result = await bookStorage.getBookById(id);
      return Right(result);
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }
}