import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/book_card.dart';
import 'package:ebook_searching/presentation/common_widgets/book_genre_card.dart';
import 'package:ebook_searching/presentation/reuse_component/booktud_icon.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
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
        appBar: AppBar(
          leading: const BookTudIcon(),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
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
        bottomNavigationBar: _buildBottomNavigationbar(),
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
          Row(
            children: [
              BookGenreCard(
                genre: 'Fiction',
                icon: Icons.book,
                onTap: () {},
              ),
              const SizedBox(width: 10),
              BookGenreCard(
                genre: 'Non-Fiction',
                icon: Icons.book,
                onTap: () {},
              ),
              const SizedBox(width: 10),
              BookGenreCard(
                genre: 'Fantasy',
                icon: Icons.book,
                onTap: () {},
              ),
            ],
          ),
        ],
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
          Container(
            constraints: const BoxConstraints(maxHeight: 250),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                // Replace this with the actual list of books if it's dynamic
                List<BookCard> books = [
                  const BookCard(bookTitle: 'Geografi Kelas XI', author: 'Errlanga', bookCover: bookCover1),
                  const BookCard(bookTitle: 'Firiska Kelas XI', author: 'Errlanga', bookCover: bookCover2),
                  const BookCard(bookTitle: 'Kimia Kelas XI', author: 'Errlanga', bookCover: bookCover2),
                  const BookCard(bookTitle: 'Lorem Kelas XI', author: 'Errlanga', bookCover: bookCover1),
                ];
                return books[index];
              },
              separatorBuilder: (context, index) => const SizedBox(width: 16), // Add horizontal space between items
            ),
          ),
        ],
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