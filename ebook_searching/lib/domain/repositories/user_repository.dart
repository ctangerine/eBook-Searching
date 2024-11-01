import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';

abstract class UserRepository {
  Future<Either<Failure, ProfileResponseModel>> getProfile(int userId);
  Future<Either<Failure, ProfileResponseModel>> updateProfile(UpdateProfileRequest request);
}
