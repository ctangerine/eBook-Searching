import 'package:equatable/equatable.dart';
import 'package:ebook_searching/domain/models/authen/authen_model.dart';

abstract class AuthenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenInitial extends AuthenState {}

class AuthenLoading extends AuthenState {}

class AuthenSuccess extends AuthenState {
  final AuthenResponseModel response;

  AuthenSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class AuthenFailure extends AuthenState {
  final String error;

  AuthenFailure(this.error);

  @override
  List<Object?> get props => [error];
}
