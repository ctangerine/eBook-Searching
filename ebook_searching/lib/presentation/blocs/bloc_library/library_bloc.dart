import 'package:ebook_searching/domain/usecases/library_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_library/library_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final LibraryUsecase libraryUsecase;

  LibraryBloc({
    required this.libraryUsecase,
  }) : super(LibraryInitial()) {
    on<LoadLocalLibraryEvent>(_loadLocalLibrary);
    on<AddLibraryEvent>(_addLibrary);
    on<DeleteLibraryEvent>(_deleteLibrary);
    on<GetLibraryById>(_getLibraryById);
    on<GetAllLibraries>(_getAllLibraries);
  }

  Future<void> _loadLocalLibrary(LoadLocalLibraryEvent event,Emitter<LibraryState> emit) async {
    final result = await libraryUsecase.getAllLibraries();
    result.fold(
      (failure) => emit(LoadLocalLibraryFailure(failure.errorMessage)),
      (libraries) => emit(LoadLocalLibrarySuccess(libraries, null)),
    );
  }

  Future<void> _addLibrary(AddLibraryEvent event,Emitter<LibraryState> emit) async {
    final result = await libraryUsecase.addLibrary(event.library);
    result.fold(
      (failure) => emit(LoadLocalLibraryFailure(failure.errorMessage)),
      (libraries) => emit(LoadLocalLibrarySuccess(libraries, null)),
    );
  }

  Future<void> _deleteLibrary(DeleteLibraryEvent event,Emitter<LibraryState> emit) async {
    final result = await libraryUsecase.deleteLibrary(event.id);
    result.fold(
      (failure) => emit(LoadLocalLibraryFailure(failure.errorMessage)),
      (libraries) => emit(LoadLocalLibrarySuccess(libraries, null)),
    );
  }

  Future<void> _getLibraryById(GetLibraryById event,Emitter<LibraryState> emit) async {
    final result = await libraryUsecase.getLibraryById(event.id);
    result.fold(
      (failure) => emit(GetSpecificLibraryFailure(failure.errorMessage)),
      (library) => emit(GetSpecificLibrarySuccess(library, null)),
    );
  }

  Future<void> _getAllLibraries(GetAllLibraries event,Emitter<LibraryState> emit) async {
    final result = await libraryUsecase.getAllLibraries();
    result.fold(
      (failure) => emit(LoadLocalLibraryFailure(failure.errorMessage)),
      (libraries) => emit(LoadLocalLibrarySuccess(libraries, null)),
    );
  }
}