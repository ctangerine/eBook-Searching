// show a button link to each current coding page, includes: HomeScreen, BookDetailScreen, SplashScreen, SigninScreen

import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/reviews_screen.dart';
import 'package:ebook_searching/presentation/screens/home_screen.dart';
import 'package:ebook_searching/presentation/screens/signin_screen.dart';
import 'package:ebook_searching/presentation/screens/splash_screen.dart';
import 'package:ebook_searching/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class CurrentCodingScreens extends StatelessWidget {
  const CurrentCodingScreens({Key? key}) : super(key: key);

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
                    builder: (context) => HomeScreen(),
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
                    builder: (context) => BookDetailScreen(),
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
                    builder: (context) => SplashScreen(),
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
                    builder: (context) => OnBoardingScreen(),
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
                    builder: (context) => ReviewScreen(),
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
          ],
        ),
      ),
    );
  }
}