import 'package:dio/dio.dart';
import 'package:ebook_searching/core/constant/network_constant.dart';
import 'package:ebook_searching/core/network/error/dio_error_handler.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_request.dart';
import 'package:flutter/cupertino.dart';

import 'file_api.dart';

class FileApiImpl extends FileApi {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  FileApiImpl(this.dio);

  @override
  Future<UploadFileModel> uploadFile(UploadFileRequest request) async {
    try {
      final result = await dio.post(
        NetworkConstant.filePath,
        data: request.toJson(),
        cancelToken: cancelToken,
      );

      debugPrint('result: ${result.data}');

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      return UploadFileModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      debugPrint('error here: $e');
      throw ServerException('${e}error here', null);
    }
  }

}
