import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/core/network/error/exceptions.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/user_api_impl.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';
import 'package:ebook_searching/domain/repositories/user_repository.dart';


class UserRepositoryImpl extends UserRepository {
  final UserImplApi userApi;

  UserRepositoryImpl(
      this.userApi,
      );

  @override
  Future<Either<Failure, ProfileResponseModel>> getProfile(int userId) async {
    try {
      final result = await userApi.getProfile(userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, ProfileResponseModel>> updateProfile(UpdateProfileRequest request) async {
    try {
      final result = await userApi.updateProfile(request);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}