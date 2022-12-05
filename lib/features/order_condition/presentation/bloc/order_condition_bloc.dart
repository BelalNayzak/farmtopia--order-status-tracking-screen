import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/strings/strings.dart';
import '../../domain/entities/order_condition.dart';
import '../../domain/usecases/update_order_cond_usecase.dart';

part 'order_condition_event.dart';
part 'order_condition_state.dart';

class OrderConditionBloc
    extends Bloc<OrderConditionEvent, OrderConditionState> {
  UpdateOrderConditionUsecase updateOrderCondUsecase;

  OrderConditionBloc({
    required this.updateOrderCondUsecase,
  }) : super(OrderConditionInitial()) {
    on<OrderConditionEvent>((event, state) async {
      if (event is UpdateOrderCondEvent) {
        final eitherFailureOrOrderCond = await updateOrderCondUsecase.call();
        _emitEiterFailureOrUpdatedOrderCond(eitherFailureOrOrderCond);
      }
    });
  }

  _emitEiterFailureOrUpdatedOrderCond(Either<Failure, OrderCondition> either) {
    either.fold(
      (l_failure) {
        emit(ServerErrorState(errorMsg: _mapFailureToErrorMsg(l_failure)));
      },
      (r_orderCond) {
        emit(OrderConditionUpdatedState(orderCondition: r_orderCond));
      },
    );
  }

  String _mapFailureToErrorMsg(Failure f) {
    if (f is ServerFailure) {
      return SERVER_ERROR_MSG;
    }
    return UNEXPECTED_ERROR_MSG;
  }
}
