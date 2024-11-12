import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_state.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewLibraryScreen extends StatelessWidget {
  final TextEditingController _libraryNameController = TextEditingController();

  CreateNewLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LibraryBloc>()..add(LoadLocalLibraryEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New saved list'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInputField(),
             _buildConfirmButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildInputField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Save list name',style: AppTextStyles.body2Semibold,),
        const SizedBox(height: 10),
        TextFormField(
          controller: _libraryNameController,
          decoration: const InputDecoration(
            hintText: 'Enter name of the save list',
            border: OutlineInputBorder()
          ),
        ),
        BlocConsumer<LibraryBloc, LibraryState>(
          builder: (context, state) {
            if (state is LoadLocalLibraryFailure) {
              return Center(
                child: Text('Error happen with: $state.error'),
              );
            }
            else {
              return Container();
            }
          }, 
          listener: (context, state) => {
          }
        )
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return BlocConsumer<LibraryBloc, LibraryState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: FilledButton( 
                onPressed: () {
                  final libraryName = _libraryNameController.text;
                  final libraryBloc = context.read<LibraryBloc>();
                  if (state is LoadLocalLibrarySuccess) {
                    final currentId = state.libraries.length;
                    Library library = Library(currentId == 0 ? 0 : currentId + 1, libraryName);
                    libraryBloc.add(AddLibraryEvent(library));
                  }
                },
                child: const Text('Create'),
              ),
            ),
          ],
        );
      },
      listener: (context, state) {
        if (state is LoadLocalLibrarySuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add to library success'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }
}