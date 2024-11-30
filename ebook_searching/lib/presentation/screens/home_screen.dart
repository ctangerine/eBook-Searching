import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:ebook_searching/domain/models/book/search_book_param.dart';
import 'package:ebook_searching/domain/models/genre/genre_model.dart';
import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_state.dart';
import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/library_screen.dart';
import 'package:ebook_searching/presentation/screens/search_result.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/book_card.dart';
import 'package:ebook_searching/presentation/common_widgets/book_genre_card.dart';
import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/screens/profile_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final bool _isListenerActive = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _selectedIndex == 0 ? homepageAppBar() : null,
        body: <Widget>[
          homePageScreen(),
          LibraryScreen(),
          const ProfileScreen(),
          const SearchResultScreen(),
        ][_selectedIndex],
        bottomNavigationBar: _buildBottomNavigationbar(),
      ),
    );
  }

  AppBar homepageAppBar() {
    return AppBar(
      leading: const BookTudIcon(),
      actions: [
        IconButton(
          icon: const Icon(Iconsax.notification_bing),
          onPressed: () {},
        ),
      ],
    );
  }

  MultiBlocProvider homePageScreen() {
    //final genreParam = GenreParam(limit: null, offset: null, orderBy: null, orderDirection: null);
    return MultiBlocProvider(
      providers: [
        // BlocProvider<GenreBloc>(
        //   create: (context) => sl<GenreBloc>()..add(GetAllGenreDetailEvent(genreParam)),
        // ),
        BlocProvider<BookBloc>(
          create: (context) => sl<BookBloc>()..add(SearchBookEvent(SearchBookParam.noParams()))),
      ],
      child: BlocListener<BookBloc, BookState>(
        listener: (context, state) {
          // if (_isListenerActive && state is BookDetailSuccess) {
          //   _isListenerActive = false;
          //   debugPrint('Call at homePageScreen');
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (builder) => BlocProvider.value(
          //         value: context.read<BookBloc>(),
          //         child: const BookDetailScreen(),
          //       ),
          //     ),
          //   ).then((_) {
          //     _isListenerActive = true;
          //   });
          // }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
              child: Column(
                children: [
                  _buildCarousel(),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  //_buildBookByGenreTab(),
                  _buildBookSlider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return ImageSlideshow(
      width: double.infinity,
      height: 160,
      initialPage: 0,
      indicatorColor: AppColors.primary,
      indicatorBackgroundColor: AppColors.textSecondary,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        Image.asset(homepageImage, fit: BoxFit.fitWidth),
        Image.asset(homepageImage, fit: BoxFit.fitWidth),
        Image.asset(homepageImage, fit: BoxFit.fitWidth),
        Image.asset(homepageImage, fit: BoxFit.fitWidth),
        Image.asset(homepageImage, fit: BoxFit.fitWidth),
      ],
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () {
        _showSearchResultScreen();
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search any books',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(color: AppColors.textSecondary, width: 2.0),
            ),
            enabled: false,
          ), // Disable the TextField to make it non-editable
        ),
      ),
    );
  }

  void _showSearchResultScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchResultScreen(),
      ),
    );
  }

  Widget _buildBookByGenreTab() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          const Row(
            children: [
              Text('Explore by genre', style: AppTextStyles.title1Semibold),
              Spacer(),
              // TextButton(
              //   onPressed: () {},
              //   style: lightTheme.textButtonTheme.style?.copyWith(
              //     foregroundColor: WidgetStateProperty.all(AppColors.textSecondary),
              //   ),
              //   child: const Text('View all', style: AppTextStyles.body3Semibold),
              // ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<GenreBloc, GenreState>(
            builder: (context, state) {
              if (state is GenreLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GenreSuccess) {
                return _buildGenreList(state.response.data);
              } else if (state is GenreFailure) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary),
                  ),
                );
              } else {
                return const Center(child: Text('No genres available'));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGenreList(List<GenreModel> genres) {
    if (genres.isEmpty) {
      return const Center(child: Text('No genres available'));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: genres.map((genre) {
          return Padding(
            padding: const EdgeInsets.only(left: 0, right: 10),
            child: BookGenreCard(
              genre: genre.name,
              icon: Icons.book,
              onTap: () {
                // Handle genre tap
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBookSlider() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        children: [
          const Row(
            children: [
              Text('Class XI books just for you!', style: AppTextStyles.title1Semibold),
              Spacer(),
              // TextButton(
              //   onPressed: () {},
              //   style: lightTheme.textButtonTheme.style?.copyWith(
              //     foregroundColor: WidgetStateProperty.all(AppColors.textSecondary),
              //   ),
              //   child: const Text('View all', style: AppTextStyles.body3Semibold),
              // ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchBookSuccess) {
                debugPrint('get ok');
                return _buildBookList(state.response.data);
              } else if (state is SearchBookFailure) {
                debugPrint(state.error);
                //return Center(child: Text('Error: ${state.error}'));
                return _buildErrorState();
              } else if (state is BookDetailFailure) {
                return const Center(child: Text('Error: Failed to get book detail'));
              } else if (state is BookDetailSuccess) {
                return const Center(child: Text('Error: Failed to get book detail'));
              } else {
                return const Center(child: Text('No books available'));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Image.asset(findingImage),
            const Text('Oops! Something went wrong!', style: AppTextStyles.body2Medium),
          ],
        ),
      ),
    );
  }

  BlocListener _buildBookList(List<BookModel>? books) {
    return BlocListener<BookBloc, BookState>(
      listener: (context, state) {
        if (state is BookDetailSuccess) {
          debugPrint('Call at buildBookList');
          Navigator.push(
            context,  
            MaterialPageRoute(
              builder: (builder) => BlocProvider.value(
                value: context.read<BookBloc>(),
                child: const BookDetailScreen(),
              ),
            ),
          );
        }
      },
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: books!.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return BookCard(
              bookTitle: book.title!,
              author: book.authors?[0].name,
              bookCover: book.image,
              onTap: () {
                final bookBloc = context.read<BookBloc>();
                bookBloc.add(GetBookDetailEvent(book.id));
                debugPrint('add once');
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 12),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationbar() {
    return SizedBox(
      height: 61, // Chiều cao của TabBar
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.book, size: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, size: 20),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle, size: 20),
            label: 'Profile',
          ),
        ],
        selectedItemColor: AppColors.primary,
        unselectedItemColor: const Color.fromARGB(255, 48, 60, 80),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

}