import 'package:ebook_searching/app_config.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/usecases/user_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  UserBloc({required this.getProfileUseCase, required this.updateProfileUseCase}) : super(UserInitial()) {
    on<GetProfileEvent>(_getProfileDetail);
    on<UpdateProfileEvent>(_updateProfile);
  }

  Future<void> _getProfileDetail(GetProfileEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());

    if (!AppConfig().isPassAPI) {
      final result = await getProfileUseCase(event.userId);

      result.fold(
            (failure) => emit(GetProfileFailure(_mapFailureToMessage(failure))),
            (response) => emit(GetProfileSuccess(response)),
      );
    }
    else {
      emit(GetProfileSuccess(await _getMockUserData()));
    }
  }

  Future<void> _updateProfile(UpdateProfileEvent event, Emitter<UserState> emit) async {
    if (AppConfig().isPassAPI) {
      emit(UserLoading());
      ProfileModel result = await _getMockUserData();
      result = result.copyWith(
        fullName: event.request.fullName,
        gender: event.request.gender,
        dateOfBirth: event.request.dateOfBirth,
      );
      if (!emit.isDone) emit(UpdateProfileSuccess(result));
    } else {
      emit(UserLoading());
      final result = await updateProfileUseCase(event.request);

      await result.fold(
        (failure) async {
          debugPrint("id: ${event.request.userId}");
          final user = await getProfileUseCase(event.request.userId);
          await user.fold(
            (failure) async {
              if (!emit.isDone) emit(GetProfileFailure(_mapFailureToMessage(failure)));
            },
            (response) async {
              if (!emit.isDone) emit(GetProfileSuccess(response, message: _mapFailureToMessage(failure)));
            },
          );
        },
        (response) async {
          if (!emit.isDone) emit(UpdateProfileSuccess(response));
        },
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }

  Future<ProfileResponseModel> _getMockUserData() async {
    await Future.delayed(const Duration(seconds: 2));

    return ProfileResponseModel(
      setup: false,
      userId: 102210131,
      email: "doquan@gmail.com",
      username: "Do Quan",
      fullName: "Đỗ Minh Quân",
      gender: "Nam",
      dateOfBirth: DateTime(2003, 04, 25).toString()
    );
  }
}
