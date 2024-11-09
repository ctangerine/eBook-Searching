import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';

abstract class LibraryStorage {
  Future<void> addLibrary(Library library);
  Future<void> deleteLibrary(int id);
  Future<Library?> getLibraryById(int id);
  Future<List<Library>> getAllLibraries();
}