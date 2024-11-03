import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

// Search book
class SearchBookSuccess extends BookState {
  final BookResponseModel response;

  SearchBookSuccess(this.response);

  //copyWith method
  SearchBookSuccess copyWith({
    BookResponseModel? response,
  }) {
    return SearchBookSuccess(
      response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [response];
}

class SearchBookFailure extends BookState {
  final String error;

  SearchBookFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Book detail
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
