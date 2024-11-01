import 'package:ebook_searching/domain/models/genre/genre_param.dart';
import 'package:equatable/equatable.dart';

abstract class GenreEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAllGenreDetailEvent extends GenreEvent {
  final GenreParam param;

  GetAllGenreDetailEvent(this.param);

  @override
  List<Object?> get props => [param];
}
