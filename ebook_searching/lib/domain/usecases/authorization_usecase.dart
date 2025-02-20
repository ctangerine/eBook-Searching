import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/usecase/usecase.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';
import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';
import 'package:ebook_searching/domain/repositories/authen_repository.dart';


class SignInUseCase extends UseCase<AuthenResponseModel, SignInRequest> {
  final AuthenRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, AuthenResponseModel>> call(SignInRequest params) {
    return repository.signIn(params);
  }
}

class SignUpUseCase extends UseCase<AuthenResponseModel, SignUpRequest> {
  final AuthenRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, AuthenResponseModel>> call(SignUpRequest params) {
    return repository.signUp(params);
  }
}

class GetLocalInfoAuthenUseCase extends UseCase<AuthenModel, Void> {
  final AuthenRepository repository;

  GetLocalInfoAuthenUseCase(this.repository);

  @override
  Future<Either<Failure, AuthenModel>> call(Void params) {
    return repository.getLocalAuthenInfo();
  }
}