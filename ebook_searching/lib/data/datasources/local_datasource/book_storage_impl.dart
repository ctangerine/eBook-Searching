import 'package:ebook_searching/data/datasources/local_datasource/book_storage.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:realm/realm.dart';

class BookStorageImpl implements BookStorage {
  final Realm realm;

  BookStorageImpl(this.realm);

  @override
  Future<void> addBook(RealmBookDetailModel book) async {
    realm.write(() {
      realm.add(book);
    });
  }

  @override
  Future<void> deleteBook(int id) async {
    final book = realm.find<RealmBookDetailModel>(id);
    if (book != null) {
      realm.write(() {
        realm.delete(book);
      });
    }
  }

  @override
  Future<RealmBookDetailModel?> getBookById(int id) async {
    return realm.find<RealmBookDetailModel>(id);
  }

  @override
  Future<List<RealmBookDetailModel>> getAllBooks() async {
    final books = realm.all<RealmBookDetailModel>();
    return books.toList();
  }
}
