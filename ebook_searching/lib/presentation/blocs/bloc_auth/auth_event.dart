import 'package:equatable/equatable.dart';
import 'package:ebook_searching/domain/models/authen/sign_in_request.dart';
import 'package:ebook_searching/domain/models/authen/sign_up_request.dart';

abstract class AuthenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthenEvent {
  final SignInRequest request;

  SignInEvent(this.request);

  @override
  List<Object?> get props => [request];
}

class SignUpEvent extends AuthenEvent {
  final SignUpRequest request;

  SignUpEvent(this.request);

  @override
  List<Object?> get props => [request];
}
