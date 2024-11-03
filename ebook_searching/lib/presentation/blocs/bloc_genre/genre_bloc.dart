import 'package:ebook_searching/app_config.dart';
import 'package:ebook_searching/domain/models/genre/genre_model.dart';
import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';
import 'package:ebook_searching/domain/usecases/genre_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GetAllGenreUseCase getAllGenreUseCase;

  GenreBloc({required this.getAllGenreUseCase}) : super(GenreInitial()) {
    on<GetAllGenreDetailEvent>(_getAllGenre);
  }

  Future<void> _getAllGenre(GetAllGenreDetailEvent event, Emitter<GenreState> emit) async {
    if (AppConfig().isPassAPI) {
      emit(GenreLoading());
      emit(GenreSuccess(await _getMockGenreData()));
    }
    else {
      emit(GenreLoading());
      final result = await getAllGenreUseCase(event.param);

      result.fold(
            (failure) => emit(GenreFailure(_mapFailureToMessage(failure))),
            (response) => emit(GenreSuccess(response)),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }

  Future<GenreResponseModel> _getMockGenreData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final mockResponse = GenreResponseModel(
      data: [
        GenreModel(name: 'Fiction', id: 1),
        GenreModel(name: 'Drama', id: 2),
        GenreModel(name: 'Mystery', id: 3),
        GenreModel(name: 'Non-Fiction', id: 4),
        GenreModel(name: 'Fantasy', id: 5),
      ],
      limit: 3,
      numpages: 3,
      offset: 3,
      totalItems: 5
    );

    return mockResponse;
  }
}
      
