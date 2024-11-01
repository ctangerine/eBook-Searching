import 'package:ebook_searching/domain/models/genre/genre_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class GenreState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GenreInitial extends GenreState {}

class GenreLoading extends GenreState {}

class GenreSuccess extends GenreState {
  final GenreResponseModel response;

  GenreSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class GenreFailure extends GenreState {
  final String error;

  GenreFailure(this.error);

  @override
  List<Object?> get props => [error];
}
