import 'package:dartz/dartz.dart';

import 'package:fruits_hub/core/entities/products_entity.dart';

import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/models/products_model.dart';

import '../../services/database_service.dart';
import '../../utils/backend_endpoint.dart';
import 'products_repo.dart';

class ProductsRepoImplementation extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImplementation(this.databaseService);
  @override
  Future<Either<Failure, List<ProductsEntity>>> getAllProducts() async {
    try {
      var products = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;
      List<ProductsModel> productsList =
          products.map((e) => ProductsModel.fromJson(e)).toList();
      List<ProductsEntity> productsEntityList =
          productsList.map((e) => e.toEntity()).toList();
      return right(productsEntityList);
    } catch (e) {
      return left(ServerFailure('حدث خطأ أثناء جلب المنتجات: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntity>>> getBestSellingProducts() async {
    try {
      var products = await databaseService.getData(
          path: BackendEndpoint.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;
      List<ProductsModel> productsList =
          products.map((e) => ProductsModel.fromJson(e)).toList();
      List<ProductsEntity> productsEntityList =
          productsList.map((e) => e.toEntity()).toList();
      return right(productsEntityList);
    } catch (e) {
      return left(ServerFailure('حدث خطأ أثناء جلب المنتجات: $e'));
    }
  }
}
