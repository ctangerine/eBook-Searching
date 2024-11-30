import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/file_api_impl.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_request.dart';
import 'package:ebook_searching/domain/repositories/file_repository.dart';


class FileRepositoryImpl extends FileRepository {
  final FileApiImpl fileApi;

  FileRepositoryImpl(
      this.fileApi,
      );

  @override
  Future<Either<Failure, UploadFileModel>> uploadFile(UploadFileRequest request) async {
    try {
      final result = await fileApi.uploadFile(request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
    catch (e) {
      return Left(ServerFailure(e.toString(), null));
    }
  }
}