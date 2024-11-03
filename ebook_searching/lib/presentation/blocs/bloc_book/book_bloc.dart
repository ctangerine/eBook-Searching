import 'package:ebook_searching/domain/usecases/book_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBookDetailUseCase getBookDetailUseCase;
  final SearchBookUseCase searchBookUseCase;
  final AddBookToStorageUseCase addBookToStorage;
  final DeleteBookStorageUseCase deleteBookStorage;
  final GetAllBookStorageUseCase getAllBookStorage;
  final GetBookByIdStorageUseCase getBookByIdStorage;

  BookBloc({
    required this.getBookDetailUseCase,
    required this.searchBookUseCase,
    required this.addBookToStorage,
    required this.deleteBookStorage,
    required this.getAllBookStorage,
    required this.getBookByIdStorage
  }) : super(BookInitial()) {
    on<GetBookDetailEvent>(_getBookDetail);
    on<SearchBookEvent>(_searchBook);
    on<AddBookStorageEvent>(_addBookStorage);
    on<DeleteBookStorageEvent>(_deleteBookStorage);
    on<GetAllBooksStorageEvent>(_getAllBooksStorage);
    on<GetBookByIdStorageEvent>(_getBookByIdStorage);
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

  Future<void> _addBookStorage(AddBookStorageEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final result = await addBookToStorage(event.book);

    result.fold(
          (failure) => emit(AddBookStorageFailure(_mapFailureToMessage(failure))),
          (_) => emit(AddBookStorageSuccess()),
    );
  }

  Future<void> _deleteBookStorage(DeleteBookStorageEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final result = await deleteBookStorage(event.bookId);

    result.fold(
          (failure) => emit(DeleteBookStorageFailure(_mapFailureToMessage(failure))),
          (_) => emit(DeleteBookStorageSuccess()),
    );
  }

  Future<void> _getAllBooksStorage(GetAllBooksStorageEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final result = await getAllBookStorage(NoParams());

    result.fold(
          (failure) => emit(GetAllBooksStorageFailure(_mapFailureToMessage(failure))),
          (books) => emit(GetAllBooksStorageSuccess(books)),
    );
  }

  Future<void> _getBookByIdStorage(GetBookByIdStorageEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    final result = await getBookByIdStorage(event.bookId);

    result.fold(
          (failure) => emit(GetBookByIdStorageFailure(_mapFailureToMessage(failure))),
          (book) => emit(GetBookByIdStorageSuccess(book)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }
}
