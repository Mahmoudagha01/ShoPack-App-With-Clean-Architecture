import 'package:dartz/dartz.dart';
import 'package:shopack_user/core/error/failure.dart';


abstract class BaseUsecase<T,Params>{
Future<Either<Failure,T>> call(Params params);
}
class NoParams {}