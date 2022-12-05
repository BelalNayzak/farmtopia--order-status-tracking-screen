import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/features/order_condition/domain/repositories/order_cond_repo.dart';

import '../../../../core/errors/failures.dart';
import '../entities/order_condition.dart';

class UpdateOrderConditionUsecase {
  OrderCondRepository orderCondRepo;

  UpdateOrderConditionUsecase({required this.orderCondRepo});

  Future<Either<Failure, OrderCondition>> call() {
    return orderCondRepo.updateCondition();
  }
}
