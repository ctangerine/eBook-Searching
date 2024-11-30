
import 'package:dio/dio.dart';
import 'package:ebook_searching/core/constant/network_constant.dart';
import 'package:ebook_searching/core/network/error/dio_error_handler.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/app_shared_prefs.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:flutter/foundation.dart';

import 'book_api.dart';

class BookApiImpl extends BookApi {
  final Dio dio;
  final AppSharedPrefs appSharedPrefs;
  CancelToken cancelToken = CancelToken();

  BookApiImpl(this.dio, this.appSharedPrefs);

  // Get Book Detail
  @override
  Future<BookDetailResponseModel> getBookDetail(int bookId) async {
    try {
      
      final result = await dio.get(
        "${NetworkConstant.bookPath}/$bookId",
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      return BookDetailResponseModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  // Search Books by Criteria
  @override
  Future<BookResponseModel> searchBooksByCriteria(SearchBookParam param) async {
    try {
      final result = await dio.get(
        NetworkConstant.bookSearchPath,
        queryParameters: param.toJson(),
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      final bookResponse = BookResponseModel.fromJson(result.data);

      // Save the search results to local storage
      await appSharedPrefs.cacheBookList(bookResponse);
      debugPrint('Book Response: ok');
      return bookResponse;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
