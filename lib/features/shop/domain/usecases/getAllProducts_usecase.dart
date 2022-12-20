import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/products_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUsecase extends BaseUsecase<ProductsEntity,NoParams > {
  final ProductRepository productRepository;

  GetAllProductsUsecase(this.productRepository);
  
  @override
  Future<Either<Failure, ProductsEntity>> call(NoParams params) async {
   return await productRepository.getAllProducts();
  }


}
