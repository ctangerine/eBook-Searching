import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/genre_api_impl.dart';
import 'package:ebook_searching/data/repositories_implement/genre_repo_implement.dart';
import 'package:ebook_searching/domain/repositories/genre_repository.dart';
import 'package:ebook_searching/domain/usecases/genre_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_bloc.dart';

initGenreInjections() {
  sl.registerSingleton<GenreImplApi>(GenreImplApi(DioNetwork.appAPI));
  sl.registerSingleton<GenreRepository>(GenreRepositoryImpl(sl()));
  sl.registerSingleton<GetAllGenreUseCase>(GetAllGenreUseCase(sl()));

  sl.registerFactory<GenreBloc>(() => GenreBloc(
    getAllGenreUseCase: sl<GetAllGenreUseCase>(),
  ));
}
