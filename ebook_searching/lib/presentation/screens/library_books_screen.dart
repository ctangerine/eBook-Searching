import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/book_card.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class LibraryBooksScreen extends StatelessWidget {
  const LibraryBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name list', style: AppTextStyles.body2Semibold,),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20), 
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
            final books = [
              const BookCard(bookTitle: 'Lorem Ispum Lorem Ispum Lorem Ispum Lorem Ispum Lorem Ispum ', author: 'author1', bookCover: bookCover1, isHorizontal: true),
              const BookCard(bookTitle: 'bookTitle2', author: 'author2', bookCover: bookCover2, isHorizontal: true),
              const BookCard(bookTitle: 'bookTitle3', author: 'author3', bookCover: bookCover3, isHorizontal: true),
            ];
            return Card(
              color: AppColors.maintheme,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: AppColors.textSecondary,
                  width: 1,
                )
              ),
              // margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: books[index],
              ),
            );
          },
        ),
      ),
    );
  }
}