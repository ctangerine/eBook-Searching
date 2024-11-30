import 'package:ebook_searching/app_config.dart';
import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/data/datasources/app_shared_prefs.dart';
import 'package:ebook_searching/data/datasources/local_datasource/book_storage_impl.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/book_api_impl.dart';
import 'package:ebook_searching/data/repositories_implement/book_repo_implement.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/repositories/book_repository.dart';
import 'package:ebook_searching/domain/usecases/book_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:realm/realm.dart';

initBookInjections() {
  sl.registerSingleton<BookApiImpl>(BookApiImpl(DioNetwork.appAPI, sl()));
  sl.registerSingleton<BookStorageImpl>(BookStorageImpl(_realmBookConfig()));
  sl.registerSingleton<BooksRepository>(BookRepositoryImpl(sl(), sl(), sl()));
  sl.registerSingleton<GetBookDetailUseCase>(GetBookDetailUseCase(sl()));
  sl.registerSingleton<SearchBookUseCase>(SearchBookUseCase(sl()));

  sl.registerSingleton<AddBookToStorageUseCase>(AddBookToStorageUseCase(sl()));
  sl.registerSingleton<DeleteBookStorageUseCase>(DeleteBookStorageUseCase(sl()));
  sl.registerSingleton<GetBookByIdStorageUseCase>(GetBookByIdStorageUseCase(sl()));
  sl.registerSingleton<GetAllBookStorageUseCase>(GetAllBookStorageUseCase(sl()));

  sl.registerFactory<BookBloc>(() => BookBloc(
    getBookDetailUseCase: sl<GetBookDetailUseCase>(),
    searchBookUseCase: sl<SearchBookUseCase>(),
    addBookToStorage: sl<AddBookToStorageUseCase>(),
    deleteBookStorage: sl<DeleteBookStorageUseCase>(),
    getBookByIdStorage: sl<GetBookByIdStorageUseCase>(),
    getAllBookStorage: sl<GetAllBookStorageUseCase>(),
    appSharedPrefs: AppConfig().isPassAPI ? sl<AppSharedPrefs>() : sl<AppSharedPrefs>(),
  ));
}

Realm _realmBookConfig() {
  final realmConfig = Configuration.local([
    RealmBookDetailModel.schema,
    RealmAuthorModel.schema,
    RealmReviewModel.schema,
    Library.schema
    ],
    schemaVersion: 2,
    migrationCallback: (migration, oldSchemaVersion) {
      if (oldSchemaVersion < 2) {

      }
    },
  );

  return Realm(realmConfig);
}

