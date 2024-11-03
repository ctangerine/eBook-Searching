import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/usecase/usecase.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/domain/repositories/book_repository.dart';


class GetBookDetailUseCase extends UseCase<BookDetailResponseModel, int> {
  final BooksRepository repository;

  GetBookDetailUseCase(this.repository);

  @override
  Future<Either<Failure, BookDetailResponseModel>> call(int bookId) {
    return repository.getBookDetail(bookId);
  }
}

class SearchBookUseCase extends UseCase<BookResponseModel, SearchBookParam> {
  final BooksRepository repository;

  SearchBookUseCase(this.repository);

  @override
  Future<Either<Failure, BookResponseModel>> call(SearchBookParam params) {
    return repository.searchBooksByCriteria(params);
  }
}

class NoParams {}

class AddBookToStorageUseCase extends UseCase<void, RealmBookDetailModel> {
  final BooksRepository repository;

  AddBookToStorageUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(RealmBookDetailModel book) {
    return repository.addBook(book);
  }
}

class DeleteBookStorageUseCase extends UseCase<void, int> {
  final BooksRepository repository;

  DeleteBookStorageUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(int bookId) {
    return repository.deleteBook(bookId);
  }
}

class GetAllBookStorageUseCase extends UseCase<List<RealmBookDetailModel>, NoParams> {
  final BooksRepository repository;

  GetAllBookStorageUseCase(this.repository);

  @override
  Future<Either<Failure, List<RealmBookDetailModel>>> call(NoParams params) {
    return repository.getAllBooks();
  }
}

class GetBookByIdStorageUseCase extends UseCase<RealmBookDetailModel?, int> {
  final BooksRepository repository;

  GetBookByIdStorageUseCase(this.repository);

  @override
  Future<Either<Failure, RealmBookDetailModel?>> call(int bookId) {
    return repository.getBookById(bookId);
  }
}