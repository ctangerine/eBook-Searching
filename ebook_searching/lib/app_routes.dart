import 'package:ebook_searching/presentation/screens/home_screen.dart';
import 'package:ebook_searching/presentation/screens/library_screen.dart';
import 'package:ebook_searching/presentation/screens/on_boarding_screen.dart';
import 'package:ebook_searching/presentation/screens/personal_detail_screen.dart';
import 'package:ebook_searching/presentation/screens/profile_screen.dart';
import 'package:ebook_searching/presentation/screens/setup_account_screen.dart';
import 'package:ebook_searching/presentation/screens/signin_screen.dart';
import 'package:ebook_searching/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static const String homePage = '/home';
  static const String profileScreen = '/profile';
  static const String personalScreen = '/profile/personal';
  static const String signinScreen = '/signin';
  static const String signupScreen = '/signup';
  static const String setupAccountScreen = '/signup/setup';
  static const String libraryScreen = '/library';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signinScreen:
        return MaterialPageRoute(builder: (_) => SigninScreen());
      case signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case personalScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => PersonalDetailScreen(
        )
      );
      case setupAccountScreen:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(builder: (_) => SetupAccountScreen(
          email: args['email']!, password: args['password']!
        )
      );
      case libraryScreen:
        return MaterialPageRoute(builder: (_) => LibraryScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen()); // Route mặc định
    }
  }
}
