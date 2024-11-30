import 'package:ebook_searching/domain/models/authen/upload_file_model.dart';
import 'package:ebook_searching/domain/models/authen/upload_file_request.dart';

abstract class FileApi {
  Future<UploadFileModel> uploadFile(UploadFileRequest request);
}
