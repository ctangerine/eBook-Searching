import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:flutter/material.dart';

class BookTudIcon extends StatelessWidget {
  const BookTudIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(12.0),
      child: Image.asset(booktudLogo, fit: BoxFit.fill,)
    );
  }
}