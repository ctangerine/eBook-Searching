import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';


abstract class AuthenRepository {
  Future<Either<Failure, AuthenResponseModel>> signIn(SignInRequest request);
  Future<Either<Failure, AuthenResponseModel>> signUp(SignUpRequest request);
  Future<Either<Failure, AuthenResponseModel>> getLocalAuthenInfo();
}
