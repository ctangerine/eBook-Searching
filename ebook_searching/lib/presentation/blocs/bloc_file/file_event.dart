import 'package:ebook_searching/domain/models/authen/upload_file_request.dart';
import 'package:equatable/equatable.dart';

abstract class FileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadFileEvent extends FileEvent {
  final UploadFileRequest request;

  UploadFileEvent(this.request);

  @override
  List<Object?> get props => [request];
}
