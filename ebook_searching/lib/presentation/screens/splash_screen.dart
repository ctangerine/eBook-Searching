// splash screen to show the logo of the app
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
// Import the SigninScreen

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(booktudLogo),
      ),
    );
  }
}