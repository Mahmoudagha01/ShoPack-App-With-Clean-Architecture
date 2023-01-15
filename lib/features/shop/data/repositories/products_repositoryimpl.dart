import 'package:dartz/dartz.dart';
import 'package:shopack_user/features/shop/domain/entities/reviews_entity.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utilities/strings.dart';
import '../../domain/entities/products_entity.dart';
import '../../domain/entities/response_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/products_datasource.dart';

class ProductsRepositoryImpl implements ProductRepository {
  final NetworkInfo networkInfo;
  final ProductsDatasource productsDatasource;

  ProductsRepositoryImpl(this.networkInfo, this.productsDatasource);
  @override
  Future<Either<Failure, ProductsEntity>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productsDatasource.getAllProducts();
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ProductsEntity>> getSpecificProduct(
      GetProductParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productsDatasource.getSpecificProduct(params);
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> sendReview(
      SendReviewParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productsDatasource.sendReview(params);
        return right(data);
      } catch (error) {
        print(error);
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, GetReviewsEntity>> getReviews(
      GetReviewsParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await productsDatasource.getReviews(params);
        return right(data);
      } catch (error) {
        print(error);
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}
