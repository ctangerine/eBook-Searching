import 'dart:convert';

import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:ebook_searching/core/constant/app_constant.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  Future<void> cacheBookList(BookResponseModel books) async {
    try {
      final jsonString = jsonEncode(books.toJson());
      //debugPrint('Books JSON: $jsonString');
      await _preferences.setString(AppConstant.bookKey, jsonString);
    } catch (e) {
      debugPrint('Error caching book list: $e');
    }
  }

  Future<BookResponseModel> getBookList() async {
    final bookList = _preferences.getString(AppConstant.bookKey);
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

  Future<void> cacheToListRecentBook(BookModel book) async {
    try {
      final recentBooks = await getRecentBooks();
      if (recentBooks.contains(book)) {
        return;
      }
      recentBooks.add(book);
      final jsonString = jsonEncode(recentBooks);
      await _preferences.setString('recent_books', jsonString);
    } catch (e) {
      debugPrint('Error caching recent book: $e');
    }
  }

  Future<List<BookModel>> getRecentBooks() async {
    final recentBooks = _preferences.getString('recent_books');
    if (recentBooks != null) {
      try {
        final List<dynamic> jsonList = jsonDecode(recentBooks);
        return jsonList.map((e) => BookModel.fromJson(e)).toList();
      } catch (e) {
        debugPrint('Error decoding recent books: $e');
        return [];
      }
    } else {
      return [];
    }
  }

  static Future<void> deleteAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<void> saveLoginInfo(AuthenModel loginModel) async {
    String jsonString = jsonEncode(loginModel.toJson());
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstant.loginKey, jsonString);
  }

  static Future<AuthenModel?> getLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(AppConstant.loginKey);
    debugPrint('Login Info: $jsonString');
    if (jsonString == null) return null;

    Map<String, dynamic> json = jsonDecode(jsonString);
    return AuthenModel.fromJson(json);
  }

  static Future<void> clearLoginInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstant.loginKey);
  }

  static Future<void> deleteLoginDataIfFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (isFirstTime) {
      await clearLoginInfo();
      await prefs.setBool('isFirstTime', false);
    }
  }
}