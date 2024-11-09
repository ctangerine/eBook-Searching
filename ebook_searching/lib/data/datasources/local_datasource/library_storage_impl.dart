import 'package:ebook_searching/data/datasources/local_datasource/library_storage.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:realm/realm.dart';

class LibraryStorageImpl implements LibraryStorage {
  final Realm realm;

  LibraryStorageImpl(this.realm);

  @override
  Future<void> addLibrary(Library library) async {
    final libraryWithDefaults = _applyDefaultValues(library);
    realm.write(() {
      realm.add(libraryWithDefaults);
    });
  }

  @override
  Future<void> deleteLibrary(int id) async {
    final library = realm.find<Library>(id);
    if (library != null) {
      realm.write(() {
        realm.delete(library);
      });
    }
  }

  @override
  Future<Library?> getLibraryById(int id) async {
    return realm.find<Library>(id);
  }

  @override
  Future<List<Library>> getAllLibraries() async {
    final libraries = realm.all<Library>();
    return libraries.toList();
  }

  Library _applyDefaultValues(Library library) {
    return library.copyWith(
      name: library.name.isEmpty ? 'Default Library Name' : library.name,
      books: library.books.map((book) => _applyDefaultValuesToBook(book)).toList(),
    );
  }

  RealmBookDetailModel _applyDefaultValuesToBook(RealmBookDetailModel book) {
    return book.copyWith(
      avgRating: book.avgRating == 0.0 ? 3.0 : book.avgRating,
      categories: book.categories.isEmpty ? ['Uncategorized'] : book.categories,
      description: book.description.isEmpty ? 'No description available' : book.description,
      genres: book.genres.isEmpty ? ['Unknown Genre'] : book.genres,
      image: book.image.isEmpty ? 'default_image_url' : book.image,
      language: book.language.isEmpty ? 'Unknown Language' : book.language,
      publicationTime: book.publicationTime == 0 ? DateTime.now().millisecondsSinceEpoch : book.publicationTime,
      publisher: book.publisher.isEmpty ? 'Unknown Publisher' : book.publisher,
      ratingCount: book.ratingCount == 0 ? 1 : book.ratingCount,
      title: book.title.isEmpty ? 'Untitled' : book.title,
      totalPages: book.totalPages == 0 ? 100 : book.totalPages,
      uri: book.uri.isEmpty ? 'default_uri' : book.uri,
    );
  }
}