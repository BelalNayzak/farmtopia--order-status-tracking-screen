import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/order_condition.dart';

abstract class OrderCondRepository {
  Future<Either<Failure, OrderCondition>> updateCondition();
}
