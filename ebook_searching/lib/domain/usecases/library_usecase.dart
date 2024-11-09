import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/domain/repositories/library_repository.dart';

class LibraryUsecase {
  final LibraryRepository _libraryRepository;

  LibraryUsecase(this._libraryRepository);

  Future<Either<Failure, List<Library>>> addLibrary(Library library) {
    return _libraryRepository.addLibrary(library);
  }

  Future<Either<Failure, List<Library>>> deleteLibrary(int id) {
    return _libraryRepository.deleteLibrary(id);
  }

  Future<Either<Failure, Library>> getLibraryById(int id) {
    return _libraryRepository.getLibraryById(id);
  }

  Future<Either<Failure, List<Library>>> getAllLibraries() {
    return _libraryRepository.getAllLibraries();
  }
}