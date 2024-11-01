import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/book_api_impl.dart';
import 'package:ebook_searching/data/repositories_implement/book_repo_implement.dart';
import 'package:ebook_searching/domain/repositories/book_repository.dart';
import 'package:ebook_searching/domain/usecases/book_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';

initBookInjections() {
  sl.registerSingleton<BookApiImpl>(BookApiImpl(DioNetwork.appAPI));
  sl.registerSingleton<BooksRepository>(BookRepositoryImpl(sl()));
  sl.registerSingleton<GetBookDetailUseCase>(GetBookDetailUseCase(sl()));
  sl.registerSingleton<SearchBookUseCase>(SearchBookUseCase(sl()));

  sl.registerFactory<BookBloc>(() => BookBloc(
    getBookDetailUseCase: sl<GetBookDetailUseCase>(),
    searchBookUseCase: sl<SearchBookUseCase>(),
  ));
}
