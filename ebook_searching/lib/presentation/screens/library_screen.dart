import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_state.dart';
import 'package:ebook_searching/presentation/screens/save_to_library_screen.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/screens/create_new_library_screen.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryScreen extends StatelessWidget {
  final ValueNotifier<int?> _selectedCardIndex = ValueNotifier<int?>(null);
  
  LibraryScreen({super.key});

  @override
  Widget build (BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 200;
    return BlocProvider<LibraryBloc>(
      create : (context) => sl<LibraryBloc>()..add(LoadLocalLibraryEvent()),
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTabBar(),
                const SizedBox(height: 20),
                BlocBuilder<LibraryBloc, LibraryState>(
                  builder: (context, state) {
                    if (state is LoadLocalLibrarySuccess) {
                      if (state.libraries.isEmpty) {
                        return _buildEmptyList(context);
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: SavedLibraryList(
                            selectedCardIndex: _selectedCardIndex,
                            crossAxisCount: crossAxisCount,
                            toListBook: true,
                          ),
                        );
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.maintheme,
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const CreateNewLibraryScreen())
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
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
        Text(
          'There is no saved list that you have. You can create a new saved list first.',
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