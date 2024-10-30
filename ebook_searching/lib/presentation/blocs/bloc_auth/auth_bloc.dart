import 'package:ebook_searching/domain/usecases/user_usecase.dart';
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
    emit(AuthenLoading());
    final result = await signInUseCase(event.request);

    result.fold(
          (failure) => emit(AuthenFailure(_mapFailureToMessage(failure))),
          (response) => emit(AuthenSuccess(response)),
    );
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthenState> emit) async {
    emit(AuthenLoading());
     final result = await signUpUseCase(event.request);

    result.fold(
          (failure) => emit(AuthenFailure(_mapFailureToMessage(failure))),
          (response) => emit(AuthenSuccess(response)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }
}
