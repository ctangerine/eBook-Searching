import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/data/datasources/local_datasource/library_storage_impl.dart';
import 'package:ebook_searching/data/repositories_implement/library_repo_implement.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/repositories/library_repository.dart';
import 'package:ebook_searching/domain/usecases/library_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_bloc.dart';
import 'package:realm/realm.dart';

initLibraryInjections() {
  sl.registerSingleton<LibraryStorageImpl>(LibraryStorageImpl(_realmLibraryConfig()));
  sl.registerSingleton<LibraryRepository>(LibraryRepoImplement(sl()));
  sl.registerSingleton(LibraryUsecase(sl()));

  sl.registerFactory<LibraryBloc>(() => LibraryBloc(
    libraryUsecase: sl<LibraryUsecase>(),
  ));
}

Realm _realmLibraryConfig() {
  // Add all required schemas here; including Library
  final realmConfig = Configuration.local([
    RealmBookDetailModel.schema,
    RealmAuthorModel.schema,
    RealmReviewModel.schema,
    Library.schema,  // Include the Library schema
    ],
    schemaVersion: 2, // Incremented from the previous version
    migrationCallback: (migration, oldSchemaVersion) {
      if (oldSchemaVersion < 2) {
        // Handle migration logic here if needed
        // For example, if the id was previously an ObjectId and is now an int
      }
    },
  );

  return Realm(realmConfig);
}
