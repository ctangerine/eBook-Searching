import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';

abstract class LibraryRepository {
  Future<Either<Failure, List<Library>>> addLibrary(Library library);
  Future<Either<Failure, List<Library>>> deleteLibrary(int id);
  Future<Either<Failure, Library>> getLibraryById(int id);
  Future<Either<Failure, List<Library>>> getAllLibraries();
}