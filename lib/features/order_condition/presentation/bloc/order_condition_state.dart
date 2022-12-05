part of 'order_condition_bloc.dart';

@immutable
abstract class OrderConditionState {}

class OrderConditionInitial extends OrderConditionState {}

class OrderConditionUpdatedState extends OrderConditionState {
  final OrderCondition orderCondition;

  OrderConditionUpdatedState({required this.orderCondition});
}

class ServerErrorState extends OrderConditionState {
  final String errorMsg;

  ServerErrorState({required this.errorMsg});
}
