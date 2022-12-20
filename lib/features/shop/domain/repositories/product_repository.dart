import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';
import 'package:shop_app/features/shop/domain/entities/response_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsEntity>> getAllProducts();
  Future<Either<Failure, ProductsEntity>> getSpecificProduct(
      GetProductParams params);
  Future<Either<Failure, ResponseEntity>> sendReview(SendReviewParams params);
}

class GetProductParams {
  final String category;
  final String minPrice;
  final String maxPrice;
  final String rate;
  final String keyword;
  GetProductParams(
      this.category, this.minPrice, this.maxPrice, this.rate, this.keyword);
}

class SendReviewParams {
  final String productId;
  final String comment;
  final num rating;

  SendReviewParams(this.productId, this.comment, this.rating);
}
