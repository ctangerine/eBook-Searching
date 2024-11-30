import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_request.dart';

abstract class FileRepository {
  Future<Either<Failure, UploadFileModel>> uploadFile(UploadFileRequest request);
}
