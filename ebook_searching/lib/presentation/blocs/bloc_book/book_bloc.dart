import 'package:ebook_searching/app_config.dart';
import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/review/review_model.dart';
import 'package:ebook_searching/domain/usecases/book_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
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
    on<LoadingSuggestionsEvent>(_getRecommendBook);
    on<AddBookStorageEvent>(_addBookStorage);
    on<DeleteBookStorageEvent>(_deleteBookStorage);
    on<GetAllBooksStorageEvent>(_getAllBooksStorage);
    on<GetBookByIdStorageEvent>(_getBookByIdStorage);
  }

  Future<void> _getBookDetail(GetBookDetailEvent event, Emitter<BookState> emit) async {
    if (AppConfig().isPassAPI) {
      final result = await _getMockBookData();
      final mockDetail = result.data?[event.bookId % 3];
      result.bookDetail = result.bookDetail?.copyWith(
        id: mockDetail?.id,
        authors: mockDetail?.authors,
        avgRating: mockDetail?.avgRating,
        categories: ['Literature', 'Sci-Life'],
        title: mockDetail?.title,
        image: mockDetail?.image,
      );
      emit(SearchBookSuccess(result));
    }
    else {
      emit(BookLoading());
      final result = await getBookDetailUseCase(event.bookId);

      result.fold(
            (failure) => emit(BookDetailFailure(_mapFailureToMessage(failure))),
            (response) => emit(BookDetailSuccess(response)),
      );
    }
  }

  Future<void> _searchBook(SearchBookEvent event, Emitter<BookState> emit) async {
    if (AppConfig().isPassAPI) {
      emit(BookLoading());
      final result = await _getMockBookData();
      emit(SearchBookSuccess(result));
    }
    else {
      emit(BookLoading());
      final result = await searchBookUseCase(event.param);

      result.fold(
            (failure) => emit(SearchBookFailure(_mapFailureToMessage(failure))),
            (response) => emit(SearchBookSuccess(response)),
      );
    }
  }

  Future<void> _getRecommendBook(LoadingSuggestionsEvent event, Emitter<BookState> emit) async {
    if (AppConfig().isPassAPI) {
      final result = await _getMockBookData();
      emit(SearchBookSuccess(result));
    }
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

  Future<BookResponseModel> _getMockBookData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final mockReponse = BookResponseModel(
      data: [
        BookModel(
          id: 1,
          uri: 'abc',
          avgRating: 1.0,
          image: bookCover1,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Washing Machine Heart',
        ),
        BookModel(
          id: 2,
          uri: 'abc',
          avgRating: 2.0,
          image: bookCover2,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Mine all mine',
        ),
        BookModel(
          id: 3,
          uri: 'abc',
          avgRating: 3.0,
          image: bookCover3,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Me and my husband',
        ),
        BookModel(
          id: 4,
          uri: 'abc',
          avgRating: 1.0,
          image: bookCover1,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Washing Machine Heart',
        ),
        BookModel(
          id: 5,
          uri: 'abc',
          avgRating: 2.0,
          image: bookCover2,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Mine all mine',
        ),
        BookModel(
          id: 6,
          uri: 'abc',
          avgRating: 3.0,
          image: bookCover3,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Me and my husband',
        ),
        BookModel(
          id: 7,
          uri: 'abc',
          avgRating: 1.0,
          image: bookCover1,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Washing Machine Heart',
        ),
        BookModel(
          id: 8,
          uri: 'abc',
          avgRating: 2.0,
          image: bookCover2,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Mine all mine',
        ),
        BookModel(
          id: 9,
          uri: 'abc',
          avgRating: 3.0,
          image: bookCover3,
          authors: [
            AuthorModel(name: 'Mitski Miyawaki')
          ],
          title: 'Me and my husband',
        ),
      ],
      limit: 10,
      numPages: 1,
      offset: 0,
      totalItems: 10,
      bookDetail: BookDetailModel(
        authors: [AuthorModel(name: 'Mistki Miyawaki')],
        avgRating: 4.0,
        categories: ['Literature', 'Sci-Life'],
        description: 'A book about love and life, with long description',
        genres: ['genres1', 'genres2'],
        id: 1,
        image: bookCover1,
        language: 'English',
        publicationTime: 2019,
        publisher: 'Gaggoo',
        ratingCount: 4,
        reviews: [ReviewModel(image: avatar, reviewer: 'Myself', content: 'Perfect all kill', time: 2024)],
        title: 'Mine all mine',
        totalPages: 203,
        uri: 'abc'
      ),
      author: AuthorModel(name: 'Mitski Miyawaki'),
    );

    return mockReponse;
  }
}
