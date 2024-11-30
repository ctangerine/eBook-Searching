import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/domain/usecases/book_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/common_widgets/book_cover_showcase.dart';
import 'package:ebook_searching/presentation/common_widgets/review_card.dart';
import 'package:ebook_searching/presentation/screens/author_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/reviews_screen.dart';
import 'package:ebook_searching/presentation/screens/save_to_library_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (bool didPop, Object? object) async {
        if (didPop) {
          final bloc = context.read<BookBloc>();
          bloc.add(SearchBookEvent(SearchBookParam.noParams(), false));
          debugPrint('Back to search result');
        } // Allows pop to proceed
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.maintheme,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () {
              final bloc = context.read<BookBloc>();
              bloc.add(SearchBookEvent(SearchBookParam.noParams(), false));
              debugPrint('Back to search result');
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
              SizedBox(
                width: 200,
                child: Text(
                  bookDetail?.title ?? 'No information',
                  style: AppTextStyles.title1Semibold,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 80,
            height: 48,
            child: IconButton(
              onPressed: () {
                saveToLibrarySheet(context);
              },
              icon: const Icon(Iconsax.archive_minus, size: 30),
              style: lightTheme.textButtonTheme.style?.copyWith(
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                padding: const WidgetStatePropertyAll(EdgeInsets.fromLTRB(20, 10, 20, 10)),
                side: WidgetStateProperty.all(const BorderSide(color: AppColors.textSecondary, width: 0.5)),
              ),
            ),

          )
        ],
      ),
    );
  }

  Future<dynamic> saveToLibrarySheet(BuildContext context) {
    final bookBloc = context.read<BookBloc>();
    final state = bookBloc.state;
    final bookDetail = state is SearchBookSuccess ? state.response.bookDetail : state is BookDetailSuccess ? state.response : null;
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
          child: BlocProvider.value(
            value: bookBloc,
            child: SaveToLibraryScreen(bookId: bookDetail!.id),
          ),
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
          buildDetailRow("Publisher", bookDetail?.publisher ?? 'No information'),
          buildDetailRow("Writers", (bookDetail?.authors?.isNotEmpty ?? false) ? bookDetail!.authors!.map((author) => author.name).join(', ') : 'No information'),
          buildDetailRow("Language", bookDetail?.language ?? 'No information'),
          buildDetailRow("Categories", (bookDetail?.genres?.isNotEmpty ?? false) ? bookDetail!.genres!.join(', ') : 'No information'),
          buildDetailRow("Total pages", (bookDetail?.totalPages ?? 0) > 0 ? bookDetail!.totalPages.toString() : (100 + (bookDetail!.id + bookDetail.id)*bookDetail.id % 200 ).toString()),
            buildDetailRow(
            "Published date",
            (bookDetail?.publicationTime ?? 0) > 0
              ? bookDetail!.publicationTime.toString()
              : DateTime.now()
                .subtract(Duration(days: 365 * (10 + (bookDetail.id.hashCode) % 11)))
                .toString(),
            ),
          buildAuthorPageLink(context),
        ],
      ),
    );
  }

  Widget buildAuthorPageLink(BuildContext context) {
    final bookDetail = _getBookDetail(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: TextButton(
        onPressed: () async {
          final author = bookDetail?.authors?.first;
          if (author != null) {
            final searchUsecase = sl.get<SearchBookUseCase>();
            final response = await searchUsecase(SearchBookParam.noParams());
            response.fold(
              (l) => debugPrint('Error when searching author page'),
              (r) {
                // find all books belong to author
                final books = r.data?.where((book) => book.authors?.first.name == author.name).toList();
                final BookResponseModel authorBookResposne = BookResponseModel(
                  data: books,
                );
                if (books != null && books.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthorDetailScreen(author: author, authorBooks: authorBookResposne),
                    )
                  );
                }
              },
            );
          }
        },
        style: lightTheme.textButtonTheme.style?.copyWith(
          padding: WidgetStateProperty.all(const EdgeInsets.only(left: 0, top: 8, right: 12, bottom: 8)),
        ),
        child: Text('View author page', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary)),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: Text(label,style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary))),
          Expanded(flex: 5, child: Text(value, style: AppTextStyles.body2Semibold.copyWith(height: 1.6))),
        ],
      ),
    );
  }

   Widget _buildBookDescription(BuildContext context) {
    final bookDetail = _getBookDetail(context);
    String synopsisText = bookDetail?.description ?? 'No information';

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Description', style: AppTextStyles.title1Semibold),
          const SizedBox(height: 10),
          ReadMoreText(
            synopsisText,
            trimLines: 8,
            colorClickableText: AppColors.primary,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...see more',
            trimExpandedText: ' see less',
            style: AppTextStyles.body2Regular.copyWith(letterSpacing: 0.5, height: 20 / 14),
          ),
        ],
      ),
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
                    name: review.reviewer,
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
    final state = context.read<BookBloc>().state;
    if (state is SearchBookSuccess) {
      return state.response.bookDetail;
    } else if (state is BookDetailSuccess) {
      return state.response;
    }
    return null;
  }
}

