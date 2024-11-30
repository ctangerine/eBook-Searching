

import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    autoPlay: false,
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
    final state = context.read<BookBloc>().state;
    if (state is SearchBookSuccess) {
      return state.response.bookDetail;
    } else if (state is BookDetailSuccess) {
      return state.response;
    }
    else {
      debugPrint(state.toString());
      return null;
    }
  }
}