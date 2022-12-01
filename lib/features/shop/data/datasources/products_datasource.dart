import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/utilities/endpoints.dart';
import 'package:shop_app/features/shop/data/models/products_model.dart';

abstract class ProductsDatasource {
  Future<ProductsModel> getAllProducts();
}

class ProductsDatasourceImpl implements ProductsDatasource {
  final APIProvider apiProvider;

  ProductsDatasourceImpl(this.apiProvider);
  @override
  Future<ProductsModel> getAllProducts() async {
    final response = await apiProvider.get(endPoint: productsEndPoint);
    print(response.data);
    return ProductsModel.fromJson(response.data);
  }
}
