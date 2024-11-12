import 'package:ebook_searching/presentation/common_widgets/book_card.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/core/injections.dart';

class LibraryBooksScreen extends StatelessWidget {
  final int libraryID;

  const LibraryBooksScreen({super.key, required this.libraryID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookBloc>()..add(GetAllBooksStorageEvent(libraryID)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Name list', style: AppTextStyles.title1Semibold),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetAllBooksStorageSuccess) {
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: state.books.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final book = state.books[index];
                    return Card(
                      shadowColor: const Color.fromARGB(255, 202, 208, 217),
                      elevation: 3,
                      color: AppColors.maintheme,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                          color: AppColors.themeSecondary,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: BookCard(
                          bookTitle: book.title,
                          author: book.authors.isNotEmpty ? book.authors[0].name : 'Unknown',
                          bookCover: book.image,
                          isHorizontal: true,
                        ),
                      ),
                    );
                  },
                );
              } else if (state is GetAllBooksStorageFailure) {
                return Center(child: Text('Error: ${state.error}'));
              } else {
                return const Center(child: Text('No books available'));
              }
            },
          ),
        ),
      ),
    );
  }
}