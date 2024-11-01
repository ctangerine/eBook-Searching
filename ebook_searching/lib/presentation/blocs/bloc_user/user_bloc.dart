import 'package:ebook_searching/domain/usecases/user_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_state.dart';
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
    final result = await getProfileUseCase(event.userId);

    result.fold(
          (failure) => emit(GetProfileFailure(_mapFailureToMessage(failure))),
          (response) => emit(GetProfileSuccess(response)),
    );
  }

  Future<void> _updateProfile(UpdateProfileEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    final result = await updateProfileUseCase(event.request);

    result.fold(
          (failure) => emit(UpdateProfileFailure(_mapFailureToMessage(failure))),
          (response) => emit(UpdateProfileSuccess(response)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }
}
