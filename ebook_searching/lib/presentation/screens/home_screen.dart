import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/book_model.dart';
import 'package:ebook_searching/domain/models/genre/genre_model.dart';
import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_genre/genre_state.dart';
import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/book_card.dart';
import 'package:ebook_searching/presentation/common_widgets/book_genre_card.dart';
import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/screens/library_screen.dart';
import 'package:ebook_searching/presentation/screens/profile_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _selectedIndex == 0 ? homepageAppBar() : null,
        body: <Widget>[
          homePageScreen(),
          const LibraryScreen(),
          const ProfileScreen(),
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
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {
            },
          ),
        ],
      );
  }

  MultiBlocProvider homePageScreen() {
    final genreParam = GenreParam(limit: 3, offset: 3, orderBy: 'name', orderDirection: 'direction');
    return MultiBlocProvider(
      providers: [
        BlocProvider<GenreBloc>(
          create: (context) => sl<GenreBloc>()..add(GetAllGenreDetailEvent(genreParam)),
        ),
        BlocProvider(create: (context) => sl<BookBloc>()..add(LoadingSuggestionsEvent())),
      ],
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
              child: Column(
                children: [
                  _buildCarousel(),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  _buildBookByGenreTab(),
                  _buildBookSlider(),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget _buildCarousel() {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
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
      ]
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search any books',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(color: AppColors.textSecondary, width: 2.0),
          ),
        ),
      ),
    );
  }

  Widget _buildBookByGenreTab() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Explore by genre', style: AppTextStyles.title1Semibold),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: lightTheme.textButtonTheme.style?.copyWith(
                  foregroundColor: WidgetStateProperty.all(AppColors.textSecondary),
                ),
                child: const Text('View all', style: AppTextStyles.body3Semibold),
              ),
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
                return Center(child: Text(state.error));
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: genres.map((genre) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
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
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Class XI books just for you!', style: AppTextStyles.title1Semibold),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: lightTheme.textButtonTheme.style?.copyWith(
                  foregroundColor: WidgetStateProperty.all(AppColors.textSecondary),
                ),
                child: const Text('View all', style: AppTextStyles.body3Semibold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              if (state is BookLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchBookSuccess) {
                return _buildBookList(state.response.data);
              } else if (state is SearchBookFailure) {
                return Center(child: Text(state.error));
              } else {
                return const Center(child: Text('No books available'));
              }
            },
          ),
        ],
      ),
    );
  }

  BlocListener _buildBookList(List<BookModel> books) {
    return BlocListener<BookBloc, BookState>(
      listener: (context, state) {
        if (state is SearchBookSuccess) {
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
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return BookCard(
              bookTitle: book.title!,
              author: book.authors[0].name,
              bookCover: book.image,
              onTap: () {
                final bookBloc = context.read<BookBloc>();
                bookBloc.add(GetBookDetailEvent(book.id));
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16), // Add horizontal space between items
        ),
      ),
    );
  }

  Widget _buildBottomNavigationbar() {
    return FlashyTabBar(
      selectedIndex: _selectedIndex,
      showElevation: true,
      onItemSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        FlashyTabBarItem(icon: const Icon(Icons.home, size: 20, color: Color.fromARGB(255, 48, 60, 80)), title: Text('Home', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary))),
        FlashyTabBarItem(icon: const Icon(Icons.book, size: 20, color: Color.fromARGB(255, 48, 60, 80)), title: Text('Library', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary))),
        FlashyTabBarItem(icon: const Icon(Icons.person, size: 20, color: Color.fromARGB(255, 48, 60, 80)), title: Text('Profile', style: AppTextStyles.body2Semibold.copyWith(color: AppColors.primary))),
      ],
    );
  }

  
}