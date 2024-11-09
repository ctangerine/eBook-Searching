import 'package:ebook_searching/domain/models/book/realm_book_detail_model.dart';
import 'package:equatable/equatable.dart';

abstract class LibraryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLocalLibraryEvent extends LibraryEvent {}

class AddLibraryEvent extends LibraryEvent {
  final Library library;

  AddLibraryEvent(this.library);

  @override
  List<Object?> get props => [library];
}

class DeleteLibraryEvent extends LibraryEvent {
  final int id;

  DeleteLibraryEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetLibraryById extends LibraryEvent {
  final int id;

  GetLibraryById(this.id);

  @override
  List<Object?> get props => [id];
}

class GetAllLibraries extends LibraryEvent {}

