import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';

abstract class BaseUsecase<T,Params>{
Future<Either<Failure,T>> call(Params params);
}