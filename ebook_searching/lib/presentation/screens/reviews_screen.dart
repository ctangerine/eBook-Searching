import 'package:ebook_searching/domain/models/review/review_model.dart';
import 'package:ebook_searching/presentation/reuse_component/custom_rating_tag.dart';
import 'package:ebook_searching/presentation/common_widgets/review_card.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final List<ReviewModel> comments;

  const ReviewScreen({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        decoration: const BoxDecoration(
          color: AppColors.maintheme,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildOverrallRatingTag(),
            const SizedBox(height: 20),
            _buildCommentByRatingBar(),
            const SizedBox(height: 20),
            _buildCommentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Review (${comments.length})', style: AppTextStyles.title1Semibold.copyWith(color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildOverrallRatingTag() {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: AppColors.themeSecondary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Color.fromARGB(255, 251, 190, 36)),
              SizedBox(width: 10),
              Text('4.9', style: AppTextStyles.heading3Semibold),
            ],
          ),
          const SizedBox(height: 10),
          Text('Overall score', style: AppTextStyles.body2Regular.copyWith(color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildCommentByRatingBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: FilledButton(
                      onPressed: () {},
                      child: const Text('All review'),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomRatingTag(rating: (6 - index).toDouble(), onOverall: false),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentList() {
    return Expanded(
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: ReviewCard(
                  maxLines: 9,
                  avatar: comment.image,
                  name: comment.reviewer,
                  rating: 4,
                  date: DateTime(2024, 11, comment.time),
                  review: comment.content,
                ),
              ),
              const SizedBox(
                height: 40,
                child: Divider(),
              ),
            ],
          );
        },
      ),
    );
  }
}