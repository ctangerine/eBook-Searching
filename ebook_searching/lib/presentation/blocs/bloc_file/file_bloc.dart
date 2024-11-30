import 'package:ebook_searching/app_config.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:ebook_searching/domain/usecases/file_usecase.dart';
import 'package:ebook_searching/presentation/blocs/bloc_file/file_event.dart';
import 'package:ebook_searching/presentation/blocs/bloc_file/file_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final UploadFileUseCase uploadFileUseCase;

  FileBloc({required this.uploadFileUseCase}) : super(FileInitial()) {
    on<UploadFileEvent>(_onUploadFile);
  }

  Future<void> _onUploadFile(UploadFileEvent event, Emitter<FileState> emit) async {
    if (AppConfig().isPassAPI) {
      emit(FileLoading());
      final result = await _getMockResponseData();
      emit(FileSuccess(result));
    } else {
      emit(FileLoading());
      final result = await uploadFileUseCase(event.request);

      result.fold(
            (failure) => emit(FileFailure(_mapFailureToMessage(failure))),
            (response) => emit(FileSuccess(response)),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage ?? "An unexpected error occurred.";
  }

  Future<UploadFileModel> _getMockResponseData() async {
    await Future.delayed(const Duration(seconds: 2));
    
    return UploadFileModel(filePath: "ebooks/quan.png");
  }
}
