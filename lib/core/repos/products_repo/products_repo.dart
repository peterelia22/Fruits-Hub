import 'package:dartz/dartz.dart';

import '../../entities/products_entity.dart';
import '../../errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsEntity>>> getAllProducts();
  Future<Either<Failure, ProductsEntity>> getBestSellingProducts();
}
