import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:equatable/equatable.dart';

abstract class LibraryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LibraryInitial extends LibraryState {}

class LocalLibraryLoading extends LibraryState {}

class LoadLocalLibrarySuccess extends LibraryState {
  final List<Library> libraries;
  final String? error;

  LoadLocalLibrarySuccess(this.libraries, this.error);

  // copyWith method
  LoadLocalLibrarySuccess copyWith({
    List<Library>? libraries,
    String? error,
  }) {
    return LoadLocalLibrarySuccess(
      libraries ?? this.libraries,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [libraries];
}

class LoadLocalLibraryFailure extends LibraryState {
  final String error;

  LoadLocalLibraryFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class GetSpecificLibrarySuccess extends LibraryState {
  final Library library;
  final String? error;

  GetSpecificLibrarySuccess(this.library, this.error);

  // copyWith method
  GetSpecificLibrarySuccess copyWith({
    Library? library,
    String? error,
  }) {
    return GetSpecificLibrarySuccess(
      library ?? this.library,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [library];
}

class GetSpecificLibraryFailure extends LibraryState {
  final String error;

  GetSpecificLibraryFailure(this.error);

  @override
  List<Object?> get props => [error];
}