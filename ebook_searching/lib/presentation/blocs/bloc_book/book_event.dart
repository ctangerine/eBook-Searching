import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:equatable/equatable.dart';

// Remote api
abstract class BookEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetBookDetailEvent extends BookEvent {
  final int bookId;

  GetBookDetailEvent(this.bookId);

  @override
  List<Object?> get props => [bookId];
}

class SearchBookEvent extends BookEvent {
  final SearchBookParam param;

  SearchBookEvent(this.param);

  @override
  List<Object?> get props => [param];
}

// Local storate
class AddBookStorageEvent extends BookEvent {
  final RealmBookDetailModel book;

  AddBookStorageEvent(this.book);

  @override
  List<Object?> get props => [book];
}

class DeleteBookStorageEvent extends BookEvent {
  final int bookId;

  DeleteBookStorageEvent(this.bookId);

  @override
  List<Object?> get props => [bookId];
}

class GetAllBooksStorageEvent extends BookEvent {}

class GetBookByIdStorageEvent extends BookEvent {
  final int bookId;

  GetBookByIdStorageEvent(this.bookId);

  @override
  List<Object?> get props => [bookId];
}
