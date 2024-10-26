import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget{
  final String bookTitle;
  final String author;
  final String bookCover;

  const BookCard({
    super.key,
    required this.bookTitle,
    required this.author,
    required this.bookCover
  });

  @override
  Widget build (BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          height: 208,
          child: Card(
            color: AppColors.maintheme,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color.fromARGB(130, 156, 163, 175)),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(bookCover, fit: BoxFit.fill,),
            ),
          ),
        ),
        Text(bookTitle, style: AppTextStyles.title2Semibold),
        Text(author, style: AppTextStyles.description2Medium.copyWith(
          color: AppColors.textSecondary
        ),)
      ],
    );
  }
}