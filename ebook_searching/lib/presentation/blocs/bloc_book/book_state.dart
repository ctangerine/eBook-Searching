import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:equatable/equatable.dart';

// Remote api
abstract class BookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class SearchBookSuccess extends BookState {
  final BookResponseModel response;

  SearchBookSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class SearchBookFailure extends BookState {
  final String error;

  SearchBookFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class BookDetailSuccess extends BookState {
  final BookDetailResponseModel response;

  BookDetailSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class BookDetailFailure extends BookState {
  final String error;

  BookDetailFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Local storage
class AddBookStorageSuccess extends BookState {}

class AddBookStorageFailure extends BookState {
  final String error;

  AddBookStorageFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class DeleteBookStorageSuccess extends BookState {}

class DeleteBookStorageFailure extends BookState {
  final String error;

  DeleteBookStorageFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class GetAllBooksStorageSuccess extends BookState {
  final List<RealmBookDetailModel> books;

  GetAllBooksStorageSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

class GetAllBooksStorageFailure extends BookState {
  final String error;

  GetAllBooksStorageFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class GetBookByIdStorageSuccess extends BookState {
  final RealmBookDetailModel? book;

  GetBookByIdStorageSuccess(this.book);

  @override
  List<Object?> get props => [book];
}

class GetBookByIdStorageFailure extends BookState {
  final String error;

  GetBookByIdStorageFailure(this.error);

  @override
  List<Object?> get props => [error];
}
