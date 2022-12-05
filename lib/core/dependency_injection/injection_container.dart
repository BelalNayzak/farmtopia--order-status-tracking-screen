import 'package:farmtopia_task_app/features/comments/data/datasources/comment_remote_datasource.dart';
import 'package:farmtopia_task_app/features/comments/domain/repositories/comment_repo.dart';
import 'package:farmtopia_task_app/features/comments/domain/usecases/add_comment_usecase.dart';
import 'package:farmtopia_task_app/features/comments/domain/usecases/get_all_comments_usecase.dart';
import 'package:farmtopia_task_app/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:farmtopia_task_app/features/order_condition/data/datasources/remote_datasource.dart';
import 'package:farmtopia_task_app/features/order_condition/data/repositories/order_cond_repo_impl.dart';
import 'package:farmtopia_task_app/features/order_condition/domain/usecases/update_order_cond_usecase.dart';
import 'package:farmtopia_task_app/features/order_condition/presentation/bloc/order_condition_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../features/comments/data/repositories/comment_repo_impl.dart';
import '../../features/order_condition/domain/repositories/order_cond_repo.dart';
import '../connectivity/network_status.dart';

final gtt = GetIt.instance; // getIt = GetIt.I

Future<void> setupInjection() async {
  /// [ FEATURES - ORDER_STATUS ]

  // bloc
  gtt.registerFactory<OrderConditionBloc>(
      () => OrderConditionBloc(updateOrderCondUsecase: gtt()));

  // datasources
  gtt.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: gtt()));

  // states
  gtt.registerLazySingleton<OrderConditionUpdatedState>(
      () => OrderConditionUpdatedState(orderCondition: gtt()));

  // usecases
  gtt.registerLazySingleton<UpdateOrderConditionUsecase>(
      () => UpdateOrderConditionUsecase(orderCondRepo: gtt()));

  // repos
  gtt.registerLazySingleton<OrderCondRepository>(
      () => OrderCondRepositoryImpl(remoteDataSource: gtt()));

  /// [ FEATURES - ORDER_STATUS ]

  // Bloc
  gtt.registerFactory<CommentsBloc>(() =>
      CommentsBloc(getAllCommentsUsecase: gtt(), addCommentUsecase: gtt()));

  // usecases
  gtt.registerLazySingleton<GetAllCommentsUsecase>(
      () => GetAllCommentsUsecase(gtt()));
  gtt.registerLazySingleton<AddCommentUsecase>(() => AddCommentUsecase(gtt()));

  // remotedb
  gtt.registerLazySingleton<CommentRemoteDatabase>(
      () => CommentRemoteDatabaseImpl(gtt()));

  // repos
  gtt.registerLazySingleton<CommentRepo>(() => CommentRepoImpl(gtt()));

  // states
  gtt.registerLazySingleton<CommentsLoaded>(() => CommentsLoaded(gtt()));

  /// [ CORE ]
  gtt.registerLazySingleton<http.Client>(() => http.Client());

  gtt.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImpl(internetChecker: gtt()));
}
