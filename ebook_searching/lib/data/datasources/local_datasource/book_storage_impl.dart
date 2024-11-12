import 'package:ebook_searching/data/datasources/local_datasource/book_storage.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:realm/realm.dart';

class BookStorageImpl implements BookStorage {
  final Realm realm;

  BookStorageImpl(this.realm);

  @override
  Future<void> addBook(RealmBookDetailModel book, {int? libraryId}) async {
    try {
      realm.write(() {
        realm.add(book);

        if (libraryId == null) {
          return;
        }

        final library = realm.find<Library>(libraryId);
        if (library != null) {
          library.books.add(book);
        } else {
          final newLibrary = Library(libraryId, 'Library $libraryId', books: [book]);
          realm.add(newLibrary);
        }

        //currently delete all book
        // realm.deleteAll<RealmBookDetailModel>();
      });
    } catch (e) {
      throw Exception('Failed to add book with error: $e');
    }
  }

  @override
  Future<void> deleteBook(int id, int libraryId) async {
    final book = realm.find<RealmBookDetailModel>(id);
    final library = realm.find<Library>(libraryId);
    if (book != null) {
      realm.write(() {
        if (library != null) {
          library.books.remove(book);
        }
        realm.delete(book);
      });
    }
  }

  @override
  Future<RealmBookDetailModel?> getBookById(int id, int libraryId) async {
    final library = realm.find<Library>(libraryId);
    if (library != null) {
      try {
        return library.books.firstWhere((book) => book.id == id);
      }
      catch (e) {
        return null;
      }
    }
    else {
      return null;
    }
  }

  @override
  Future<List<RealmBookDetailModel>> getAllBooks(int libraryId) async {
    final library = realm.find<Library>(libraryId);
    if (library != null) {
      return library.books.toList();
    }
    else {
      return [];
    }
  }
}
