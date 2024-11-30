import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/usecase/usecase.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_request.dart';
import 'package:ebook_searching/domain/repositories/file_repository.dart';


class UploadFileUseCase extends UseCase<UploadFileModel, UploadFileRequest> {
  final FileRepository repository;

  UploadFileUseCase(this.repository);

  @override
  Future<Either<Failure, UploadFileModel>> call(UploadFileRequest request) {
    return repository.uploadFile(request);
  }
}
