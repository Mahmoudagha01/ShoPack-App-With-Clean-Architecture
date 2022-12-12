import 'package:flutter/material.dart';
import 'package:shop_app/core/error/error_handler.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/shop/data/datasources/products_datasource.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/features/shop/domain/repositories/product_repository.dart';

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
}
