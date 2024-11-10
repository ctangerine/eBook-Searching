import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/common_widgets/review_card.dart';
import 'package:ebook_searching/presentation/screens/reviews_screen.dart';
import 'package:ebook_searching/presentation/screens/save_to_library_screen.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.maintheme,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () {
              final bloc = context.read<BookBloc>();
              bloc.add(SearchBookEvent(SearchBookParam.noParams()));
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BookCoverShowcase(),
                  _buildNameTag(context),
                  Container(height: 10, width: double.infinity, color: AppColors.themeSecondary),
                  _buildBookInfo(context),
                  Container(height: 10, width: double.infinity, color: AppColors.themeSecondary),
                  _buildBookDescription(context),
                  Container(height: 10, width: double.infinity, color: AppColors.themeSecondary),
                  _buildComments(context),
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
    final bookDetail = _getBookDetail(context);

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
                  padding: WidgetStateProperty.all(const EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8)),
                  side: WidgetStateProperty.all(const BorderSide(color: AppColors.textSecondary, width: 0.5)),
                ),
                onPressed: () => {},
                child: Row(
                  children: [
                    const Icon(Icons.book, color: AppColors.textPrimary),
                    Text(
                      "  ${bookDetail?.genres?.join(', ')}" ?? 'No information',
                      style: AppTextStyles.body2Semibold.copyWith(color: AppColors.textPrimary),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                bookDetail?.title ?? 'No information',
                style: AppTextStyles.title1Semibold,
              )
            ],
          ),
          IconButton(
            onPressed: () {
              saveToLibrarySheet(context);
            },
            icon: const Icon(Iconsax.archive_minus, size: 30),
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
        ),
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

  Widget _buildBookInfo(BuildContext context) {
    final bookDetail = _getBookDetail(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDetailRow("Stock", "8/10 book"),
          buildDetailRow("Borrowed by", "240 students"),
          buildDetailRow("Book position", "A12 - Second column on\nNatural Science bookshelf"),
          buildDetailRow("Publisher", bookDetail?.publisher ?? 'No information'),
          buildDetailRow("Writer", bookDetail?.authors?.first.name ?? 'No information'),
          buildDetailRow("Language", bookDetail?.language ?? 'No information'),
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
          Expanded(
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

  Widget _buildBookDescription(BuildContext context) {
    final bookDetail = _getBookDetail(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        String synopsisText = bookDetail?.description ?? 'No information';

        final TextPainter textPainter = TextPainter(
          text: TextSpan(
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
                style: AppTextStyles.body2Regular.copyWith(letterSpacing: 0.5, height: 20 / 14),
                maxLines: isOverflowing ? 8 : null,
                overflow: isOverflowing ? TextOverflow.ellipsis : null,
              ),
              if (isOverflowing)
                TextButton(
                  style: lightTheme.textButtonTheme.style?.copyWith(
                    foregroundColor: WidgetStateProperty.all(AppColors.primary),
                  ),
                  onPressed: () {},
                  child: const Text('see more', style: AppTextStyles.body3Semibold),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildComments(BuildContext context) {
    final bookDetail = _getBookDetail(context);
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
                  Text(bookDetail?.reviews?.length.toString() ?? '0', style: AppTextStyles.title1Medium),
                  Text('(mostly good)', style: AppTextStyles.title1Medium.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...?bookDetail?.reviews?.map((review) => Column(
                children: [
                  ReviewCard(
                    maxLines: 2,
                    name: review.reviewer ?? 'Anonymous',
                    review: review.content ?? 'No review content',
                    rating: 4,
                    date: review.time != null ? DateTime.fromMillisecondsSinceEpoch(review.time) : DateTime.now(),
                    avatar: review.image,
                  ),
                  const SizedBox(height: 50, child: Divider(color: AppColors.themeSecondary)),
                ],
              )),
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
    final bookDetail = _getBookDetail(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
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
          child: ReviewScreen(comments: bookDetail?.reviews ?? []), // Your ReviewPage widget here
        );
      },
    );
  }

  BookDetailModel? _getBookDetail(BuildContext context) {
    final state = context.watch<BookBloc>().state;
    if (state is SearchBookSuccess) {
      return state.response.bookDetail;
    } else if (state is BookDetailSuccess) {
      return state.response;
    }
    return null;
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

  @override
  Widget build(BuildContext context) {
    final bookDetail = _getBookDetail(context);
    final imgList = [bookDetail?.image ?? 'assets/default_book_cover.png'];
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
                  items: imgList.map((item) => _buildImage(item)).toList(),
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

  Widget _buildImage(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            defaultBookCover,
            fit: BoxFit.cover,
          );
        },
      );
    } else if (_isBase64(imageUrl)) {
      Uint8List bytes = base64Decode(imageUrl);
      return Image.memory(
        bytes,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            defaultBookCover,
            fit: BoxFit.cover,
          );
        },
      );
    } else if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            defaultBookCover,
            fit: BoxFit.cover,
          );
        },
      );
    } else {
      return Image.asset(
        defaultBookCover,
        fit: BoxFit.cover,
      );
    }
  }

  bool _isBase64(String str) {
    try {
      base64Decode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  BookDetailModel? _getBookDetail(BuildContext context) {
    final state = context.watch<BookBloc>().state;
    if (state is SearchBookSuccess) {
      return state.response.bookDetail;
    } else if (state is BookDetailSuccess) {
      return state.response;
    }
    return null;
  }
}