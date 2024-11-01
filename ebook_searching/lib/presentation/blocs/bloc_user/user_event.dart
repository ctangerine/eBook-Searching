import 'package:ebook_searching/domain/models/profile/update_profile_request.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends UserEvent {
  final int userId;

  GetProfileEvent(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UpdateProfileEvent extends UserEvent {
  final UpdateProfileRequest request;

  UpdateProfileEvent(this.request);

  @override
  List<Object?> get props => [request];
}