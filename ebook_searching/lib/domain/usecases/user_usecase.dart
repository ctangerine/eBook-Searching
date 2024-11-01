import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/usecase/usecase.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';
import 'package:ebook_searching/domain/repositories/user_repository.dart';


class GetProfileUseCase extends UseCase<ProfileResponseModel, int> {
  final UserRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Either<Failure, ProfileResponseModel>> call(int userId) {
    return repository.getProfile(userId);
  }
}

class UpdateProfileUseCase extends UseCase<ProfileResponseModel, UpdateProfileRequest> {
  final UserRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, ProfileResponseModel>> call(UpdateProfileRequest request) {
    return repository.updateProfile(request);
  }
}
