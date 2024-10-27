import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomRatingTag extends StatelessWidget {
  const CustomRatingTag({
    super.key,
    required this.rating,
    this.onOverall,
  });

  final double rating;
  final bool? onOverall;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.textSecondary, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.star, color: Color.fromARGB(255, 251, 190, 36), size: 20,),
          const SizedBox(width: 5),
          Text(
            onOverall == true ? '$rating/5' : rating.toString(), 
            style: AppTextStyles.body2Semibold
          ),
        ],
      ),
    );
  }
}