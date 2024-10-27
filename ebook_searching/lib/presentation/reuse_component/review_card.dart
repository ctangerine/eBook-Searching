import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ebook_searching/presentation/reuse_component/custom_rating_tag.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';


class ReviewCard extends StatelessWidget {
  final String name;
  final String? avatar;
  final String? review;
  final double rating;
  final DateTime date;
  final int? maxLines;

  const ReviewCard({super.key, 
    required this.name,
    this.avatar,
    this.review,
    required this.rating,
    required this.date,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.textSecondary, width: 0.5),
                  ),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: avatar != null ? AssetImage(avatar!) : null,
                    child: avatar == null ? const Icon(Icons.person, size: 20) : null,
                  ),
                ),
                const SizedBox(width: 10),
                Text(name, style: AppTextStyles.title2Medium),
              ],
            ),
            CustomRatingTag(rating: rating, onOverall: true),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
            child: Text(
            review ?? '', 
            style: AppTextStyles.body2Regular, 
            maxLines: maxLines, 
            overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.visible,
            ),
        ),
        const SizedBox(height: 7),
        Container(
          padding: const EdgeInsets.fromLTRB(45, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM d, yyyy').format(date), 
                style: AppTextStyles.body3Medium.copyWith(color: AppColors.textSecondary)
              ),
              Text('${date.hour}:${date.minute}', style: AppTextStyles.body3Medium.copyWith(color: AppColors.textSecondary)),
            ],
          ),
        )
      ],
    );
  }
}