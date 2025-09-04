import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.ordersRepo) : super(PlaceOrderInitial());
  final OrdersRepo ordersRepo;
  Future<void> placeOrder({required OrderEntity order}) async {
    emit(PlaceOrderLoading());
    final result = await ordersRepo.placeOrder(order: order);
    result.fold(
      (failure) => emit(PlaceOrderFailure(failure.message)),
      (success) => emit(PlaceOrderSuccess()),
    );
  }
}
