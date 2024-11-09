import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_state.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/library_card.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveToLibraryScreen extends StatelessWidget {
  final ValueNotifier<int?> _selectedCardIndex = ValueNotifier<int?>(null);

  SaveToLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width ~/ 200;
    return BlocProvider(
      create: (context) => sl<LibraryBloc>()..add(LoadLocalLibraryEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add to my save list', style: AppTextStyles.title1Semibold),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SavedLibraryList(
                selectedCardIndex: _selectedCardIndex,
                crossAxisCount: crossAxisCount,
              ),
              const SizedBox(height: 20),
              _buildActionButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildActionButton(BuildContext context) {
    return Row(
      children: [
        _buildCancelButon(context),
        const SizedBox(width: 20),
        _buildSaveButton(),
      ],
    );
  }

  Expanded _buildSaveButton() {
    return Expanded(
      child: FilledButton(
        onPressed: () {
          // Handle save action
        },
        child: const Text('Save'),
      ),
    );
  }

  Expanded _buildCancelButon(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel', style: AppTextStyles.body2Semibold),
      ),
    );
  }
}

class SavedLibraryList extends StatelessWidget {
  const SavedLibraryList({
    super.key,
    required ValueNotifier<int?> selectedCardIndex,
    required this.crossAxisCount,
  }) : _selectedCardIndex = selectedCardIndex;

  final ValueNotifier<int?> _selectedCardIndex;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          if (state is LocalLibraryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadLocalLibrarySuccess) {
            return ValueListenableBuilder<int?>(
              valueListenable: _selectedCardIndex,
              builder: (context, selectedIndex, child) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: state.libraries.length,
                  itemBuilder: (context, index) {
                    final library = state.libraries[index];
                    final libraryCover = library.books.isNotEmpty
                        ? library.books[0].image ?? defaultBookCover
                        : defaultBookCover;
                    return Container(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      child: LibraryCard(
                        libraryName: library.name,
                        libraryCover: libraryCover,
                        isSelected: selectedIndex == index,
                        onTap: () {
                          _selectedCardIndex.value = index;
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is LoadLocalLibraryFailure) {
            return Center(child: Text(state.error, style: AppTextStyles.body2Medium.copyWith(color: AppColors.textSecondary)));
          } else {
            return const Center(child: Text('No libraries available'));
          }
        },
      ),
    );
  }
}