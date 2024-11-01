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
    emit(GenreLoading());
    final result = await getAllGenreUseCase(event.param);

    result.fold(
          (failure) => emit(GenreFailure(_mapFailureToMessage(failure))),
          (response) => emit(GenreSuccess(response)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }
}
