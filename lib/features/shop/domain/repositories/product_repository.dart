import 'package:dartz/dartz.dart';
import 'package:shopack_user/features/shop/domain/entities/reviews_entity.dart';
import '../../../../core/error/failure.dart';
import '../entities/products_entity.dart';
import '../entities/response_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductsEntity>> getAllProducts();
  Future<Either<Failure, ProductsEntity>> getSpecificProduct(
      GetProductParams params);
  Future<Either<Failure, ResponseEntity>> sendReview(SendReviewParams params);
  Future<Either<Failure, GetReviewsEntity>> getReviews(GetReviewsParams params);
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

class GetReviewsParams {
  final String productId;

  GetReviewsParams(this.productId);
}
