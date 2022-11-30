import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, Productsentity>> getAllProducts();
}
