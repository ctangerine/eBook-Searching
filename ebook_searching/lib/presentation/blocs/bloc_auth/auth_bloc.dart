import 'package:ebook_searching/app_config.dart';
import 'package:ebook_searching/data/datasources/app_shared_prefs.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/profile/profile_model.dart';
import 'package:ebook_searching/domain/usecases/authorization_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  
  AuthenBloc({required this.signInUseCase, required this.signUpUseCase}) : super(AuthenInitial()) {
    on<SignInEvent>(_onSignIn);
    on<SignUpEvent>(_onSignUp);
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthenState> emit) async {
    if (AppConfig().isPassAPI) {
      emit(AuthenLoading());
      final result = await _getMockResponseData();
      
      emit(AuthenSuccess(result));
    } else {
      emit(AuthenLoading());
      final result = await signInUseCase(event.request);
      
      result.fold(
        (failure) => emit(AuthenFailure(_mapFailureToMessage(failure))),
        (response) {
          AppSharedPrefs.saveLoginInfo(response);
          emit(AuthenSuccess(response));
        },
      );
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthenState> emit) async {
    if (AppConfig().isPassAPI) {
      emit(AuthenLoading());
      final result = await _getMockResponseData();
      emit(AuthenSuccess(result));
    }
    else {
      emit(AuthenLoading());
      final result = await signUpUseCase(event.request);

      result.fold(
        (failure) => emit(AuthenFailure(_mapFailureToMessage(failure))),
        (response) => emit(AuthenSuccess(response)),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }

  Future<AuthenResponseModel> _getMockResponseData() async {
    await Future.delayed(const Duration(seconds: 2));
    final profileModel = ProfileResponseModel(
      setup: false,
      userId: 102210131,
      email: "doquan@gmail.com",
      username: "Do Quan",
      fullName: "Đỗ Minh Quân",
      gender: "Nam",
      dateOfBirth: DateTime(2003, 04, 25).toString(),
    );

    return AuthenResponseModel(
      profile: profileModel,
      accessToken: "accessToken",
      expirationTimestamp: 3600,
    );
  }
}
