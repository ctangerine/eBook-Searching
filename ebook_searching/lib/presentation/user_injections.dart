import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/user_api_impl.dart';
import 'package:ebook_searching/data/repositories_implement/user_repo_implement.dart';
import 'package:ebook_searching/domain/repositories/user_repository.dart';
import 'package:ebook_searching/domain/usecases/user_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_user/user_bloc.dart';

initUserInjections() {
  sl.registerSingleton<UserImplApi>(UserImplApi(DioNetwork.appAPI));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<GetProfileUseCase>(GetProfileUseCase(sl()));
  sl.registerSingleton<UpdateProfileUseCase>(UpdateProfileUseCase(sl()));

  sl.registerFactory<UserBloc>(() => UserBloc(
    getProfileUseCase: sl<GetProfileUseCase>(),
    updateProfileUseCase: sl<UpdateProfileUseCase>(),
  ));
}
