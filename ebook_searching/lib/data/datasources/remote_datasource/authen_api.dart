import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';


abstract class AuthenApi {
  // Get all article
  Future<AuthenResponseModel> signIn(SignInRequest request);
  Future<AuthenResponseModel> signUp(SignUpRequest request);
}
