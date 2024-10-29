import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';


abstract class BookApi {
  Future<BookDetailResponseModel> getBookDetail(int bookId);
  Future<BookResponseModel> searchBooksByCriteria(SearchBookParam param);
}
