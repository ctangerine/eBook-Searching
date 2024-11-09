import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/common_widgets/book_card.dart';
import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _isButtonVisible = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookBloc>(
      create: (context) => sl<BookBloc>(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              children: [
                _buildAppBar(),
                const SizedBox(height: 20),
                Expanded(child: _buildSearchResult()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 40,
            maxWidth: 40,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 45,
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                hintText: 'Search any books',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: AppColors.textSecondary, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: AppColors.textSecondary, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: AppColors.textSecondary, width: 1.0),
                ),
              ),
            ),
          ),
        ),
        if (_isButtonVisible) _buildSearchButton(),
      ],
    );
  }

  Widget _buildSearchButton() {
    return Builder(
      builder: (context) {
        return TextButton( 
          onPressed: () {
            final searchKey = _searchController.text;
            final bookBloc = context.read<BookBloc>();
            final searchParam = SearchBookParam.noParams().copyWith(keyword: searchKey);
            bookBloc.add(SearchBookEvent(searchParam));
          },
          child: Text(
            'Search',
            style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary),
          ),
        );
      },
    );
  }

  Widget _buildSearchResult() {
    return BlocConsumer<BookBloc, BookState>(
      listener: (context, state) {
        if (state is SearchBookSuccess && _apiResponseBookDetail(state.response)) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => BlocProvider.value(
                value: context.read<BookBloc>(),
                child: const BookDetailScreen(),
              ),
            ),
          );
          // build a snake bar inform that the book is found
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Book found: ${state.response.bookDetail!.title}'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
        else if (state is BookDetailFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Get book detail failed with error: ${state.error}'),
              duration: const Duration(seconds: 20),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is BookLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SearchBookSuccess) {
          if (state.response.totalItems == 0) {
            return _buildErrorState('We don\'t find any book with that keyword');
          }
          
          if (_apiResponseListAuthor(state.response)) {
            return _buildListAuthor(state.response);
          }

          if (state.response.data!.isNotEmpty) {
            return ListView.separated(
              itemCount: state.response.totalItems!,
              itemBuilder: (context, index) {
                final book = state.response.data![index];
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.maintheme,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.textSecondary,
                      width: 1,
                    ),
                  ),
                  child: BookCard(
                    bookTitle: book.title!,
                    author: book.authors?[0].name,
                    bookCover: book.image,
                    isHorizontal: true,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            );
          }
          
        }
        if (state is SearchBookFailure) {
          return _buildErrorState('We don\'t find any book with that keyword');
        }
        return _buildErrorState('');
      },
    );
  }

  Widget _showNoResult() {
    return const Center(child: Text('No result found'));
  }

  bool _apiResponseBookDetail(BookResponseModel response) {
    if (response.bookDetail != null) {
      return true;
    }
    return false;
  }

  bool _apiResponseListAuthor(BookResponseModel response) {
    if (response.bookDetail == null && response.data == null) {
      if (response.author != null) {
        return true;
      }
    }
    return false;
  }

  Widget _buildBookDetail(BookResponseModel response) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => BlocProvider.value(
          value: context.read<BookBloc>(),
          child: const BookDetailScreen(),
        ),
      ),
    );
    return const SizedBox(); // Return a widget to avoid the error
  }

  Widget _buildListAuthor(BookResponseModel response) {
    return const Text('Currently not have UI');
  }

    Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Image.asset(findingImage),
          Text(message, style: AppTextStyles.body2Medium),
        ],
      ),
    );
  }
}