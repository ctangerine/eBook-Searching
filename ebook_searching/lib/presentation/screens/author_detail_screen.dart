import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/author/author_model.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/common_widgets/image_handler.dart';
import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class AuthorDetailScreen extends StatelessWidget {
  final AuthorModel author;
  final BookResponseModel authorBooks;

  AuthorDetailScreen({super.key, AuthorModel? author, BookResponseModel? authorBooks})
      : author = author ?? AuthorModel.defaultInstance,
        authorBooks = authorBooks ?? BookResponseModel.bookResponseModelMockData;  

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookBloc>(
      create: (context) => sl<BookBloc>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('Author', style: AppTextStyles.heading2Semibold,),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            //padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShortBio(context),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(),
                ),
                const SizedBox(height: 15),
                _buildDescription(context),
                _buildBookList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShortBio(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageHandler(
                imageUrl: author.image ?? avatar,
                defaultImage: avatar,
                fit: BoxFit.fitHeight,
                width: 160,
                height: 160,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(author.name, style: AppTextStyles.title1Semibold.copyWith(fontSize: 20)),
                const SizedBox(height: 10),
                _buildInfoRow('Birthdate', author.birthDate),
                const SizedBox(height: 10),
                _buildInfoRow('Birthplace', author.birthPlace),
                const SizedBox(height: 10),
                _buildInfoRow('Nationality', author.nationality),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0), // Khoảng cách giữa các dòng thông tin
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.body2Regular.copyWith(
            fontSize: 16,
            height: 1.6, // Giãn cách dòng
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: AppTextStyles.body2Semibold.copyWith(fontSize: 16),
            ),
            TextSpan(
              text: value ?? 'N/A',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Short Bio', style: AppTextStyles.title1Semibold.copyWith(fontSize: 20)),
          const SizedBox(height: 10),
          ReadMoreText(
            author.description ?? 'N/A',
            trimLines: 3,
            colorClickableText: Colors.blue,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...Read More',
            trimExpandedText: ' Read Less',
            style: AppTextStyles.body2Regular.copyWith(
              fontSize: 16,
              height: 1.6,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        //border: Border.all(color: Colors.grey.withOpacity(0.5)),
        color: AppColors.themeSecondary
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 120,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
            ),
            itemCount: authorBooks.data?.length ?? 0,
            itemBuilder: (context, index) {
              final book = authorBooks.data?[index];
              return _buildBookItem(context, book!);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, BookModel book) {
    return GestureDetector(
      onTap: () async {
        final bookBloc = BlocProvider.of<BookBloc>(context);
        bookBloc.add(GetBookDetailEvent(book.id));
        await Future.delayed(const Duration(milliseconds: 100));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: bookBloc,
              child: const BookDetailScreen(),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: ImageHandler(
            imageUrl: book.image ?? defaultBookCover,
            defaultImage: defaultBookCover,
            fit: BoxFit.cover,
            width: 100,
            height: 500,
          ),
        ),
      ),
    );
  }
}