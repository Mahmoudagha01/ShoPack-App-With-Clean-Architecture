import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/utilities/endpoints.dart';
import 'package:shop_app/features/shop/data/models/products_model.dart';
import 'package:shop_app/features/shop/domain/repositories/product_repository.dart';

abstract class ProductsDatasource {
  Future<ProductsModel> getAllProducts();
  Future<ProductsModel> getSpecificProduct(GetProductParams params);
}

class ProductsDatasourceImpl implements ProductsDatasource {
  final APIProvider apiProvider;

  ProductsDatasourceImpl(this.apiProvider);
  @override
  Future<ProductsModel> getAllProducts() async {
    final response = await apiProvider.get(endPoint: productsEndPoint);
    return ProductsModel.fromJson(response.data);
  }

  @override
  Future<ProductsModel> getSpecificProduct(GetProductParams params) async {
    final response = await apiProvider.get(endPoint: productsEndPoint, query: {
      "category": params.category,
      "price[gt]": params.minPrice,
      "price[lt]": params.maxPrice,
      "ratings": params.rate,
      "keyword": params.keyword,
    });
    return ProductsModel.fromJson(response.data);
  }
}
