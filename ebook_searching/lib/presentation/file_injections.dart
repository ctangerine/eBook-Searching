import 'package:ebook_searching/core/injections.dart';
import 'package:ebook_searching/core/network/dio_network.dart';
import 'package:ebook_searching/data/datasources/remote_datasource/file_api_impl.dart';
import 'package:ebook_searching/data/repositories_implement/file_repo_implement.dart';
import 'package:ebook_searching/domain/repositories/file_repository.dart';
import 'package:ebook_searching/domain/usecases/file_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_file/file_bloc.dart';

initFileInjections() {
  sl.registerSingleton<FileApiImpl>(FileApiImpl(DioNetwork.appAPI));
  sl.registerSingleton<FileRepository>(FileRepositoryImpl(sl()));
  sl.registerSingleton<UploadFileUseCase>(UploadFileUseCase(sl()));

  sl.registerFactory<FileBloc>(() => FileBloc(
    uploadFileUseCase: sl<UploadFileUseCase>(),
  ));
}
