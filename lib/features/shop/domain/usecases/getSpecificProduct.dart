import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/shop/domain/repositories/product_repository.dart';
import '../entities/products_entity.dart';

class GetSpecificProductUseCase
    extends BaseUsecase<ProductsEntity, GetProductUseCaseParams> {
  final ProductRepository productRepository;

  GetSpecificProductUseCase(this.productRepository);
  @override
  Future<Either<Failure, ProductsEntity>> call(
      GetProductUseCaseParams params) async {
    return await productRepository.getSpecificProduct(GetProductParams(
        params.category,
        params.minPrice,
        params.maxPrice,
        params.rate,
        params.keyword));
  }
}

class GetProductUseCaseParams {
  final String category;
  final String minPrice;
  final String maxPrice;
  final String rate;
  final String keyword;
  GetProductUseCaseParams(
      this.category, this.minPrice, this.maxPrice, this.rate, this.keyword);
}
