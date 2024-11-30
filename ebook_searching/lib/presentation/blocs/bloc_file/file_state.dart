import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:equatable/equatable.dart';

abstract class FileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FileInitial extends FileState {}

class FileLoading extends FileState {}

class FileSuccess extends FileState {
  final UploadFileModel response;

  FileSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class FileFailure extends FileState {
  final String error;

  FileFailure(this.error);

  @override
  List<Object?> get props => [error];
}
