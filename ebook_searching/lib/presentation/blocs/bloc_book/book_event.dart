import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  final int? libraryId;
  final BuildContext context;

  AddBookStorageEvent(this.book, this.libraryId, this.context);

  @override
  List<Object?> get props => [book];
}

class DeleteBookStorageEvent extends BookEvent {
  final int bookId;
  final int libraryId;

  DeleteBookStorageEvent(this.bookId, this.libraryId);

  @override
  List<Object?> get props => [bookId];
}

class GetAllBooksStorageEvent extends BookEvent {
  final int libraryId;

  GetAllBooksStorageEvent(this.libraryId);

  @override
  List<Object?> get props => [libraryId];
}

class GetBookByIdStorageEvent extends BookEvent {
  final int bookId;
  final int libraryId;

  GetBookByIdStorageEvent(this.bookId, this.libraryId);

  @override
  List<Object?> get props => [bookId];
}

class LoadingSuggestionsEvent extends BookEvent {

}