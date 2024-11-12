import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';


abstract class BooksRepository {
  Future<Either<Failure, BookDetailResponseModel>> getBookDetail(int bookId);
  Future<Either<Failure, BookResponseModel>> searchBooksByCriteria(SearchBookParam param);

  Future<Either<Failure, void>> addBook(RealmBookDetailModel book, {int? libraryId});
  Future<Either<Failure, void>> deleteBook(int id, int libraryId);
  Future<Either<Failure, RealmBookDetailModel?>> getBookById(int id, int libraryId);
  Future<Either<Failure, List<RealmBookDetailModel>>> getAllBooks(int libraryId);
}
