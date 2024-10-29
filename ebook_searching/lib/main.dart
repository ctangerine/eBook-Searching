import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/presentation/screens/splash_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initInjections();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const SafeArea(
        child: Scaffold(
          body: Center(
            child: SplashScreen()
          ),
        ),
      ),
    );
  }
}
