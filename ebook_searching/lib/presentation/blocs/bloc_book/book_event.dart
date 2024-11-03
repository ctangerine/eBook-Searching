import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:equatable/equatable.dart';

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

class LoadingSuggestionsEvent extends BookEvent {
  
}