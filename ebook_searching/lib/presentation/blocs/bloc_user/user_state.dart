import 'package:ebook_searching/domain/models/book/book_detail_model.dart';
import 'package:ebook_searching/domain/models/book/book_response_model.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

// Get Profile
class GetProfileSuccess extends UserState {
  final ProfileResponseModel response;

  GetProfileSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class GetProfileFailure extends UserState {
  final String error;

  GetProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// Update Profile
class UpdateProfileSuccess extends UserState {
  final ProfileResponseModel response;

  UpdateProfileSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class UpdateProfileFailure extends UserState {
  final String error;

  UpdateProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}
