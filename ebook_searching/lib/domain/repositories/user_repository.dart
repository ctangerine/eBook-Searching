import 'package:dartz/dartz.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';

import '../../core/network/error/Failure.dart';

abstract class AuthorizationRepository {
  Future<Either<Failure, ProfileResponseModel>> getProfile(int userId);
  Future<Either<Failure, ProfileResponseModel>> updateProfile(UpdateProfileRequest request);
}
