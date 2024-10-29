import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';

abstract class ProfileApi {
  Future<ProfileResponseModel> getProfile(int userId);
  Future<ProfileResponseModel> updateProfile(UpdateProfileRequest request);
}
