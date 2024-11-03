import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/review_card.dart';
import 'package:ebook_searching/presentation/screens/reviews_screen.dart';
import 'package:ebook_searching/presentation/screens/save_to_library_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui' as ui;

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.maintheme,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,10,0,10),
            child: Center(
              child: Column(
                children: [
                  const BookCoverShowcase(),
                  _buildNameTag(context),
                  Container(height: 10, width: double.infinity, color: AppColors.themeSecondary,),
                  _buildBookInfo(),
                  Container(height: 10, width: double.infinity, color: AppColors.themeSecondary,),
                  _buildBookDescription(),
                  Container(height: 10, width: double.infinity, color: AppColors.themeSecondary,),
                  _buildComments(),
                  _buildViewCommentsButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameTag(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      color: AppColors.maintheme,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                style: lightTheme.textButtonTheme.style?.copyWith(
                  padding: WidgetStateProperty.all(const EdgeInsets.all(14)),
                  side: WidgetStateProperty.all(const BorderSide(color: AppColors.textSecondary, width: 0.5)),
                ),
                onPressed: () => {}, 
                child: const Row(
                  children: [
                    Icon(Icons.book, color: AppColors.textPrimary),
                    Text('Natural Science')
                  ],
                )
              ),
              const SizedBox(height: 20),
              const Text('Fisika Kelas XI', style: AppTextStyles.heading3Semibold)
            ],
          ),
          IconButton(
            onPressed: () {
              saveToLibrarySheet(context);
            }, 
            icon: const Icon(Icons.new_label_outlined, size: 30,),
            style: lightTheme.textButtonTheme.style?.copyWith(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
              padding: const WidgetStatePropertyAll(EdgeInsets.fromLTRB(30, 10, 30, 10)),
              side: WidgetStateProperty.all(const BorderSide(color: AppColors.textSecondary, width: 0.5)),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> saveToLibrarySheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: SaveToLibraryScreen(), // Your ReviewPage widget here
        );
      },
    );
  }

  Widget _buildBookInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow("Stock", "8/10 book"),
          buildDetailRow("Borrowed by", "240 students"),
          buildDetailRow("Book position", "A12 - Second column on\nNatural Science bookshelf"),
          buildDetailRow("Publisher", "Erlangga"),
          buildDetailRow("Writer", "Sandra Cisneros"),
          buildDetailRow("Language", "Indonesia"),
        ],
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary),
            ),
          ),
          Expanded (
            flex: 5,
            child: Text(
              value,
              style: AppTextStyles.body2Semibold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookDescription() {
  return LayoutBuilder(
    builder: (context, constraints) {
      const String synopsisText = 'The House on Mango Street is a 1984 coming-of-age novel by Mexican-American writer Sandra Cisneros. \nIt deals with Esperanza Cordero, a young man growing up in the Latino section of Chicago. \n\nThe novel has been critically acclaimed and is considered a classic of contemporary literature. It has also been used in high school and college courses around the world.';

      final TextPainter textPainter = TextPainter(
        text: const TextSpan(
          text: synopsisText,
          style: AppTextStyles.body2Medium,
        ),
        maxLines: 9, 
        textDirection: ui.TextDirection.ltr,
      );

      textPainter.layout(maxWidth: constraints.maxWidth);

      final bool isOverflowing = textPainter.didExceedMaxLines;

      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Synopsis', style: AppTextStyles.title1Semibold),
            const SizedBox(height: 10),
            Text(
              synopsisText,
              style: AppTextStyles.body2Regular.copyWith(letterSpacing: 0.5, height: 20/14),
              maxLines: isOverflowing ? 8 : null,
              overflow: isOverflowing ? TextOverflow.ellipsis : null, 
            ),
            if (isOverflowing)
              TextButton(
                style: lightTheme.textButtonTheme.style?.copyWith(
                  foregroundColor: WidgetStateProperty.all(AppColors.primary),
                ),
                onPressed: () {
                },
                child: const Text('see more', style: AppTextStyles.body3Semibold),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComments() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Review', style: AppTextStyles.title1Medium),
              Row(
                children: [
                  const Text('61', style: AppTextStyles.title1Medium),
                  Text('(mostly good)', style: AppTextStyles.title1Medium.copyWith(color: AppColors.textSecondary),)
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ReviewCard( 
            maxLines: 2,
            name: 'John Doe', 
            review: 'This book is very good, I like it very much. The story is very interesting and the characters are very well developed.',
            rating: 4.5,
            date: DateTime.now(),
          ),
          const SizedBox(height:50, child: Divider(color: AppColors.themeSecondary,)),
          //another review card
          ReviewCard(
            maxLines: 2,
            name: 'Jane Smith',
            review: 'A fascinating read with deep insights into the human condition. Highly recommended!',
            rating: 4.0,
            date: DateTime.now().subtract(const Duration(days: 2)),
          ),
        ],
      ),
    );
  }

  Widget _buildViewCommentsButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                _showReviewPage(context);
              },
              style: lightTheme.textButtonTheme.style?.copyWith(
                foregroundColor: WidgetStateProperty.all(AppColors.primary),
                side: WidgetStateProperty.all(const BorderSide(color: AppColors.textSecondary, width: 0.5)),
              ),
              child: const Text('View all reviews', style: AppTextStyles.body2Semibold),
            ),
          ),
        ],
      ),
    );
  }

  void _showReviewPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      builder: (context) {
        return const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ReviewScreen(), // Your ReviewPage widget here
        );
      },
    );
  }
}

class BookCoverShowcase extends StatefulWidget {
  const BookCoverShowcase({super.key});

  @override
  State<BookCoverShowcase> createState() => _BookCoverShowcaseState();  
}

class _BookCoverShowcaseState extends State<BookCoverShowcase> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

  final List<String> imgList = [
    bookCover1,
    bookCover2,
    bookCover3,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.themeSecondary,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 280,
                    aspectRatio: 14 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imgList.map((item) => Image.asset(item, fit: BoxFit.cover)).toList(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}