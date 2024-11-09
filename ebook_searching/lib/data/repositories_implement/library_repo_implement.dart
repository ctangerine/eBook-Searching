import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/data/datasources/local_datasource/library_storage_impl.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/repositories/library_repository.dart';
import 'package:realm/realm.dart';

class LibraryRepoImplement  extends LibraryRepository {
  final LibraryStorageImpl libraryStorageImpl;

  LibraryRepoImplement(this.libraryStorageImpl);

  @override 
  Future<Either<Failure, List<Library>>> addLibrary(Library library) async {
    try {
      await libraryStorageImpl.addLibrary(library);
      final libraries = await libraryStorageImpl.getAllLibraries();
      return Right(libraries);
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Library>>> deleteLibrary(int id) async {
    try {
      await libraryStorageImpl.deleteLibrary(id);
      final libraries = await libraryStorageImpl.getAllLibraries();
      return Right(libraries);
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Library>> getLibraryById(int id) async {
    try {
      final library = await libraryStorageImpl.getLibraryById(id);
      if (library != null) {
        return Right(library);
      } else {
        return const Left(QueryStorageFailure('Library not found'));
      }
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }
  
  @override
  Future<Either<Failure, List<Library>> > getAllLibraries() async {
    try {
      final libraries = await libraryStorageImpl.getAllLibraries();
      return Right(libraries);
    } on RealmException catch (e) {
      return Left(QueryStorageFailure(e.message));
    }
  }
}