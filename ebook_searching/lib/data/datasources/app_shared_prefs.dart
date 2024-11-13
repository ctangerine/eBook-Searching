import 'dart:convert';

import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  Future<void> cacheBookList(BookResponseModel books) async {
    try {
      final jsonString = jsonEncode(books.toJson());
      debugPrint('Books JSON: $jsonString');
      await _preferences.setString('book_list', jsonString);
    } catch (e) {
      debugPrint('Error caching book list: $e');
    }
  }

  Future<BookResponseModel> getBookList() async {
    final bookList = _preferences.getString('book_list');
    if (bookList != null) {
      try {
        debugPrint('bookList: $bookList');
        final Map<String, dynamic> jsonMap = jsonDecode(bookList);
        return BookResponseModel.fromJson(jsonMap);
      } catch (e) {
        debugPrint('Error decoding book list: $e');
        return BookResponseModel(data: []);
      }
    } else {
      return BookResponseModel(data: []);
    }
  }

  Future<void> deleteAllData() async {
    await _preferences.clear();
  }
}