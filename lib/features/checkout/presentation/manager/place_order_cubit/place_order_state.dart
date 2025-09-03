part of 'place_order_cubit.dart';

sealed class PlaceOrderState extends Equatable {
  const PlaceOrderState();

  @override
  List<Object> get props => [];
}

final class PlaceOrderInitial extends PlaceOrderState {}

final class PlaceOrderLoading extends PlaceOrderState {}

final class PlaceOrderSuccess extends PlaceOrderState {}

final class PlaceOrderFailure extends PlaceOrderState {
  final String errorMessage;
  const PlaceOrderFailure(this.errorMessage);
}
