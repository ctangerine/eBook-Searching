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
        GenreModel(name: 'Natural Science', id: 1, image: ''),
        GenreModel(name: 'Social Science', id: 2, image: ''),
        GenreModel(name: 'Math', id: 3, image: ''),
        GenreModel(name: 'English Language', id: 4, image: ''),
        GenreModel(name: 'Fantasy', id: 5, image: ''),
      ],
      limit: 3,
      numPages: 3,
      offset: 3,
      totalItems: 5,
    );

    return mockResponse;
  }
}
      
