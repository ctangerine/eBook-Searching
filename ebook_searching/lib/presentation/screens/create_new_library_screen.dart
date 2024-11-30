
import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_bloc.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_state.dart';
import 'package:ebook_searching/presentation/common_widgets/custom_popup.dart';
import 'package:ebook_searching/presentation/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewLibraryScreen extends StatefulWidget {
  const CreateNewLibraryScreen({super.key});

  @override
  _CreateNewLibraryScreenState createState() => _CreateNewLibraryScreenState();
}

class _CreateNewLibraryScreenState extends State<CreateNewLibraryScreen> {
  final TextEditingController _libraryNameController = TextEditingController();
  bool _isLibraryCreated = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LibraryBloc>()..add(LoadLocalLibraryEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New saved list'),
        ),
        body: Builder(
          builder: (context) {
            final libraryBloc = context.read<LibraryBloc>();
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInputField(),
                  _buildConfirmButton(libraryBloc),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  Column _buildInputField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Save list name', style: AppTextStyles.body2Semibold),
        const SizedBox(height: 10),
        TextFormField(
          controller: _libraryNameController,
          decoration: const InputDecoration(
            hintText: 'Enter name of the save list',
            border: OutlineInputBorder(),
          ),
        ),
        BlocConsumer<LibraryBloc, LibraryState>(
          builder: (context, state) {
            if (state is LoadLocalLibraryFailure) {
              return Center(
                child: Text('Error happen with: ${state.error}'),
              );
            } else {
              return Container();
            }
          },
          listener: (context, state) {},
        ),
      ],
    );
  }

  Widget _buildConfirmButton(LibraryBloc libraryBloc) {
    return BlocConsumer<LibraryBloc, LibraryState>(
      builder: (context, state) {
        if (state is LoadLocalLibrarySuccess) {
          return Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    final libraryName = _libraryNameController.text;
                    final currentId = state.libraries.length;
                    Library library = Library(currentId == 0 ? 0 : currentId + 1, libraryName);
                    context.read<LibraryBloc>().add(AddLibraryEvent(library));
                    setState(() {
                      _isLibraryCreated = true;
                    });
                                    },
                  child: const Text('Create'),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
        
      listener: (context, state) {
        if (_isLibraryCreated && state is LoadLocalLibrarySuccess) {
          _isLibraryCreated = false;
          showDialog(
            context: context,
            builder: (context) {
              return CustomPopup(
                title: 'Create new library',
                content: 'Create new library successfully',
                confirmText: 'OK',
                onConfirm: () {
                  libraryBloc.add(LoadLocalLibraryEvent());
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                onCancel: () {
                  libraryBloc.add(LoadLocalLibraryEvent());
                  Navigator.pop(context);
                },
              );
            },
          );
        }
      },
    );
  }
}