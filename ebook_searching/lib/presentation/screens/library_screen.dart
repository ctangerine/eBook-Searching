import 'package:ebook_searching/presentation/assets_link.dart';
import 'package:ebook_searching/presentation/screens/create_new_library_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});


  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Library', style: AppTextStyles.heading2Semibold),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 25,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height/2,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabBar(),
              _buildEmptyList(context),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FilledButton(
          onPressed: () => {}, 
          child: const Text('Saved')
        ),
        const SizedBox(width: 10),
        OutlinedButton(
          onPressed: ()=>{}, 
          child: const Text('Recent', style: AppTextStyles.title1Semibold,)
        )
      ],
    );
  }

  Widget _buildEmptyList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(searchImage, width: 160, height: 160),
        const SizedBox(height: 20),
        const Text('No saved list', style: AppTextStyles.heading3Semibold),
        const SizedBox(height: 5,),
        Text('There is no saved list that you have. You can create a new saved list first.', 
          style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const CreateNewLibraryScreen())
            );
          }, 
          icon: const Icon(Icons.add), 
          label: const Text('Create')
        ),
      ],
    );
  }
}