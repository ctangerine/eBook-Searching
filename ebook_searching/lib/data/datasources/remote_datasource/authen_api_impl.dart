import 'package:dio/dio.dart';
import 'package:ebook_searching/core/constant/network_constant.dart';
import 'package:ebook_searching/core/network/error/dio_error_handler.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';
import 'package:flutter/material.dart';

import 'authen_api.dart';

class AuthenImplApi extends AuthenApi {
  final Dio dio;
  CancelToken cancelToken = CancelToken();

  AuthenImplApi(this.dio);

  // SignIn Method
  @override
  Future<AuthenResponseModel> signIn(SignInRequest request) async {
    try {
      final result = await dio.post(
        NetworkConstant.signInPath,
        data: request.toJson(),
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      debugPrint('user data: $result.data');

      return AuthenResponseModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(handleDioError(e), e.response?.statusCode);
      } else {
        throw ServerException(handleDioError(e), e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException('${e}I just know that', null);
    }
  }

  // SignUp Method
  @override
  Future<AuthenResponseModel> signUp(SignUpRequest request) async {
    try {
      final result = await dio.post(
        NetworkConstant.signUpPath,
        data: request.toJson(),
        cancelToken: cancelToken,
      );

      if (result.data == null) {
        throw ServerException("Unknown Error", result.statusCode);
      }

      return AuthenResponseModel.fromJson(result.data);
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