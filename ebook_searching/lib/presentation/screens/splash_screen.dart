// splash screen to show the logo of the app
import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:ebook_searching/presentation/screens/book_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/current_coding_screens.dart';
import 'package:ebook_searching/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'signin_screen.dart'; // Import the SigninScreen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CurrentCodingScreens()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(booktudLogo),
      ),
    );
  }
}