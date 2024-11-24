import 'package:ebook_searching/app_routes.dart';
import 'package:ebook_searching/data/datasources/app_shared_prefs.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> checkLoginStatus(BuildContext context) async {
    final userInfo = await AppSharedPrefs.getLoginInfo();
    if (userInfo != null) {
      Navigator.of(context).pushNamed(AppRoutes.homePage);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => checkLoginStatus(context));

    return Scaffold(
      body: Center(
        child: Image.asset(booktudLogo),
      ),
    );
  }
}