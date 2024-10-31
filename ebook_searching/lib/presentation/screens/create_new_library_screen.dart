import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class CreateNewLibraryScreen extends StatelessWidget {
  const CreateNewLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New saved list'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Save list name',style: AppTextStyles.body2Semibold,),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter name of the save list',
                border: OutlineInputBorder()
              ),
            )
          ],
        ),
      ),
    );
  }
}