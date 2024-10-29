import 'package:dio/dio.dart';
import 'package:ebook_searching/core/constant/network_constant.dart';
import 'package:ebook_searching/core/network/error/dio_error_handler.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/profile_api.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';

class ProfileImplApi extends ProfileApi {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  ProfileImplApi(this.dio);

  // Get Profile
  @override
  Future<ProfileResponseModel> getProfile(int userId) async {
    try {
      final result = await dio.get(
        "${NetworkConstant.profilePath}/$userId",
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      return ProfileResponseModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  // Update Profile
  @override
  Future<ProfileResponseModel> updateProfile(UpdateProfileRequest request) async {
    try {
      final result = await dio.put(
        NetworkConstant.profilePath,
        data: request.toJson(),
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      return ProfileResponseModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
