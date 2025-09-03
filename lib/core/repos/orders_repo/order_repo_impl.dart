import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/core/services/database_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/checkout/data/models/order_model.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrdersRepo {
  final DatabaseService fireStoreService;

  OrderRepoImpl(this.fireStoreService);
  @override
  Future<Either<Failure, void>> placeOrder({required OrderEntity order}) async {
    try {
      await fireStoreService.addData(
          path: BackendEndpoint.placeOrder,
          data: OrderModel.fromEntity(order).toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
