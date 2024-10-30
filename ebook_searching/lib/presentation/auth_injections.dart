import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/authen_api_impl.dart';
import 'package:ebook_searching/data/repositories_implement/authorization_repo_implement.dart';
import 'package:ebook_searching/domain/repositories/authen_repository.dart';
import 'package:ebook_searching/domain/usecases/user_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_auth/auth_bloc.dart';

initAuthInjections() {
  sl.registerSingleton<AuthenImplApi>(AuthenImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AuthenRepository>(AuthenRepositoryImpl(sl()));
  sl.registerSingleton<SignInUseCase>(SignInUseCase(sl()));
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase(sl()));

  sl.registerFactory<AuthenBloc>(() => AuthenBloc(
    signInUseCase: sl<SignInUseCase>(),
    signUpUseCase: sl<SignUpUseCase>(),
  ));
}
