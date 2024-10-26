import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class BookGenreCard extends StatelessWidget {
  final String genre;
  final IconData icon;
  final Function? onTap;

  const BookGenreCard({
    super.key, 
    required this.genre,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 120,
      child: Card(
        color: AppColors.maintheme,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color.fromARGB(130, 156, 163, 175), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(genre, style: AppTextStyles.title2Semibold,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, size: 20,),
              )
            ],
          ),
        ),
      ),
    );
  }
}