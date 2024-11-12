import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_book/book_state.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_state.dart';
import 'package:ebook_searching/presentation/common_widgets/custom_popup.dart';
import 'package:ebook_searching/presentation/screens/create_new_library_screen.dart';
import 'package:ebook_searching/presentation/screens/library_books_screen.dart';
import 'package:ebook_searching/presentation/styles/assets_link.dart';
import 'package:ebook_searching/presentation/common_widgets/library_card.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveToLibraryScreen extends StatelessWidget {
  final int bookId;
  final ValueNotifier<int?> _selectedCardIndex = ValueNotifier<int?>(null);

  SaveToLibraryScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int crossAxisCount = width ~/ 200;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<BookBloc>(context),  // Use the existing BookBloc instance
        ),
        BlocProvider<LibraryBloc>(
          create: (context) => sl<LibraryBloc>()..add(LoadLocalLibraryEvent()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add to my save list', style: AppTextStyles.title1Semibold),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
        _buildCancelButton(context),
        const SizedBox(width: 20),
        _buildSaveButton(context),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return Expanded(
      child: FilledButton(
        onPressed: () {
          final bookBloc = BlocProvider.of<BookBloc>(context);
          final state = bookBloc.state;
          final currentBook = state is SearchBookSuccess ? state.response.bookDetail : (state as BookDetailSuccess).response;

          currentBook!.authors ??= [];
          currentBook.categories ??= [];

          final book = RealmBookDetailModel(
            currentBook.id,
            currentBook.avgRating ?? 0,
            currentBook.description ?? 'No descriptions',
            currentBook.image ?? defaultBookCover,
            currentBook.language ?? 'Unknown',
            currentBook.publicationTime ?? 0,
            currentBook.publisher ?? 'Unknown',
            currentBook.ratingCount ?? 0,
            currentBook.title ?? 'Unknown',
            currentBook.totalPages ?? 0,
            currentBook.uri ?? 'Unknown',
          );

          final selectedLibrary = _selectedCardIndex.value;
          bookBloc.add(AddBookStorageEvent(book, selectedLibrary, context));
        },
        child: const Text('Save'),
      ),
    );
  }

  Expanded _buildCancelButton(BuildContext context) {
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
    required this.crossAxisCount, this.toListBook = false,
  }) : _selectedCardIndex = selectedCardIndex;

  final ValueNotifier<int?> _selectedCardIndex;
  final int crossAxisCount;
  final bool? toListBook;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          if (state is LocalLibraryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadLocalLibrarySuccess) {
            if (state.libraries.isEmpty) {
              return _buildNoLibrariesAvailable(context);
            }
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
                        ? library.books[library.books.length - 1].image
                        : defaultBookCover;
                    return Container(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      child: LibraryCard(
                        libraryName: library.name,
                        libraryCover: libraryCover,
                        isSelected: selectedIndex == index,
                        onTap: toListBook ?? true ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LibraryBooksScreen(libraryID: library.id),
                            ),
                          );
                        }
                        : () {
                            _selectedCardIndex.value = index;
                        },
                        onLongPress: () {
                          debugPrint(BlocProvider.of<LibraryBloc>(context).state.toString());
                          _showDeleteConfirmation(context, library.id);
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is LoadLocalLibraryFailure) {
            return _buildNoLibrariesAvailable(context);
          } else {
            return const Center(child: Text('No libraries available'));
          }
        },
      ),
    );
  }

  Widget _buildNoLibrariesAvailable(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(findingImage),
          const Text(
            'No libraries available',
            style: AppTextStyles.body2Medium,
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => (CreateNewLibraryScreen())));
            },
            child: const Text('Create Library'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int libraryId) {
    final libraryBloc = BlocProvider.of<LibraryBloc>(context);
    debugPrint(libraryBloc.state.toString());
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: libraryBloc,
          child: CustomPopup(
            title: 'Delete Library',
            content: 'Are you sure you want to delete this library?',
            confirmText: 'Delete',
            onConfirm: () {
              libraryBloc.add(DeleteLibraryEvent(libraryId));
              Navigator.of(dialogContext).pop();
            },
          ),
        );
      },
    );
  }
}