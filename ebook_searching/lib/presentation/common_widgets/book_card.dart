import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String bookTitle;
  final String author;
  final String bookCover;
  final bool isHorizontal;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.bookTitle,
    required this.author,
    required this.bookCover,
    this.isHorizontal = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isHorizontal ? _buildHorizontalCard(context) : _buildVerticalCard(context),
    );
  }

  Widget _buildHorizontalCard(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildBookCover(),
        const SizedBox(width: 8),
        _buildBookInfo(context),
      ],
    );
  }

  Widget _buildVerticalCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBookCover(),
        _buildBookInfo(context),
      ],
    );
  }

  Widget _buildBookCover() {
    return SizedBox(
      width: isHorizontal ? 120 : 160,
      height: isHorizontal ? 150 : 210,
      child: Card(
        color: AppColors.maintheme,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(130, 156, 163, 175)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            bookCover,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildBookInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: isHorizontal ? MediaQuery.of(context).size.width - 200 : 160,
          child: Text(bookTitle, style: AppTextStyles.title2Semibold, maxLines: 1, overflow: TextOverflow.ellipsis)
        ),
        Text(
          author,
          style: AppTextStyles.description2Medium.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}