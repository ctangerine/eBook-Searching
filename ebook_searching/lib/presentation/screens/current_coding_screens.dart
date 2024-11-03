// show a button link to each current coding page, includes: HomeScreen, BookDetailScreen, SplashScreen, SigninScreen

import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/screens/library_books_screen.dart';
import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/library_screen.dart';
import 'package:ebook_searching/presentation/screens/personal_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/profile_screen.dart';
import 'package:ebook_searching/presentation/screens/reviews_screen.dart';
import 'package:ebook_searching/presentation/screens/home_screen.dart';
import 'package:ebook_searching/presentation/screens/save_to_library_screen.dart';
import 'package:ebook_searching/presentation/screens/setup_account_screen.dart';
import 'package:ebook_searching/presentation/screens/signin_screen.dart';
import 'package:ebook_searching/presentation/screens/signup_screen.dart';
import 'package:ebook_searching/presentation/screens/splash_screen.dart';
import 'package:ebook_searching/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class CurrentCodingScreens extends StatelessWidget {
  const CurrentCodingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: const Text('HomeScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookDetailScreen(),
                  ),
                );
              },
              child: const Text('BookDetailScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              child: const Text('SplashScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingScreen(),
                  ),
                );
              },
              child: const Text('SigninScreen'),
            ),
            // CommentScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReviewScreen(),
                  ),
                );
              },
              child: const Text('CommentsScreen'),
            ),
            // page for SigninScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SigninScreen(),
                  ),
                );
              },
              child: const Text('SigninScreen'),
            ),
            // page for signupScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              child: const Text('SignupScreen'),
            ),
            // page setupaccount
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetupAccountScreen(email: 'abc', password: 'cde'),
                  ),
                );
              },
              child: const Text('SetupAccountScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SaveToLibraryScreen(),
                  ),
                );
              }, child: const Text('SaveToLibraryScreen',)
            ),
            //For library screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LibraryScreen(),
                  ),
                );
              },
              child: const Text('LibraryScreen'),
            ),
            // LibraryBooksScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LibraryBooksScreen(),
                  ),
                );
              },
              child: const Text('LibraryBooksScreen'),
            ),
            //profile screen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  ProfileScreen(),
                  ),
                );
              },
              child: const Text('ProfileScreen'),
            ),
            //PersonalDetailsScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  PersonalDetailScreen(
                      fullname: 'John Doe',
                      gender: true,
                      dob: DateTime.now(),
                      avatarUrl: avatar,
                    ),
                  ),
                );
              },
              child: const Text('PersonalDetailsScreen'),
            ),
          ],
        ),
      ),
    );
  }
}