import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';
import 'package:shop_app/features/shop/domain/repositories/product_repository.dart';

class GetAllProductsUsecase extends BaseUsecase<Productsentity, NoParams> {
  final ProductRepository productRepository;

  GetAllProductsUsecase(this.productRepository);
  @override
  Future<Either<Failure, Productsentity>> call(NoParams params) async {
    return await productRepository.getAllProducts();
  }
}
