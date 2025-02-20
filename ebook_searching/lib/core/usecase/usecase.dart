import 'package:dartz/dartz.dart';
import 'package:ebook_searching/core/network/error/Failure.dart';


abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}