import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/errors/exceptions.dart';
import 'package:farmtopia_task_app/features/order_condition/data/datasources/remote_datasource.dart';
import 'package:farmtopia_task_app/features/order_condition/domain/entities/order_condition.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/order_cond_repo.dart';

class OrderCondRepositoryImpl implements OrderCondRepository {
  final RemoteDataSource remoteDataSource;

  OrderCondRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, OrderCondition>> updateCondition() async {
    try {
      OrderCondition o = await remoteDataSource.getOrderCondition();
      return Right(o);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
