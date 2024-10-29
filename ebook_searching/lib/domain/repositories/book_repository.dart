import 'package:dartz/dartz.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';

import '../../core/network/error/Failure.dart';

abstract class BooksRepository {
  Future<Either<Failure, BookDetailResponseModel>> getBookDetail(int bookId);
  Future<Either<Failure, BookResponseModel>> searchBooksByCriteria(SearchBookParam param);
}
