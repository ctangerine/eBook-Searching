import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';

abstract class BookStorage {
  Future<void> addBook(RealmBookDetailModel book);
  Future<void> deleteBook(int id, int libraryId);
  Future<RealmBookDetailModel?> getBookById(int id, int libraryId);
  Future<List<RealmBookDetailModel>> getAllBooks(int libraryId);
}