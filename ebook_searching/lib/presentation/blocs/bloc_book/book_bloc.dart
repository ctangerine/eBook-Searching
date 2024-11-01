import 'package:ebook_searching/domain/usecases/book_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBookDetailUseCase getBookDetailUseCase;
  final SearchBookUseCase searchBookUseCase;

  BookBloc({required this.getBookDetailUseCase, required this.searchBookUseCase}) : super(BookInitial()) {
    on<GetBookDetailEvent>(_getBookDetail);
    on<SearchBookEvent>(_searchBook);
  }

  Future<void> _getBookDetail(GetBookDetailEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final result = await getBookDetailUseCase(event.bookId);

    result.fold(
          (failure) => emit(BookDetailFailure(_mapFailureToMessage(failure))),
          (response) => emit(BookDetailSuccess(response)),
    );
  }

  Future<void> _searchBook(SearchBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final result = await searchBookUseCase(event.param);

    result.fold(
          (failure) => emit(SearchBookFailure(_mapFailureToMessage(failure))),
          (response) => emit(SearchBookSuccess(response)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }
}
