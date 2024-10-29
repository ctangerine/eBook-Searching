import 'package:dartz/dartz.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/authen_api.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';
import 'package:ebook_searching/domain/repositories/authen_repository.dart';

import '../../core/network/error/Failure.dart';
import '../../core/network/error/exceptions.dart';

class AuthenRepositoryImpl extends AuthenRepository {
  final AuthenApi authenApi;

  AuthenRepositoryImpl(
      this.authenApi,
      );

  @override
  Future<Either<Failure, AuthenResponseModel>> signIn(SignInRequest request) async {
    try {
      final result = await authenApi.signIn(request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, AuthenResponseModel>> signUp(SignUpRequest request) async {
    try {
      final result = await authenApi.signUp(request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}