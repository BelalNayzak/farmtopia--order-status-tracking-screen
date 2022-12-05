import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/errors/exceptions.dart';
import 'package:farmtopia_task_app/core/errors/failures.dart';
import 'package:farmtopia_task_app/features/comments/domain/entities/comment_entity.dart';
import 'package:farmtopia_task_app/features/comments/domain/repositories/comment_repo.dart';

import '../datasources/comment_remote_datasource.dart';

class CommentRepoImpl implements CommentRepo {
  CommentRemoteDatabase commentRemoteDatabase;

  CommentRepoImpl(this.commentRemoteDatabase);

  @override
  Future<Either<Failure, Unit>> addComment(CommentEntity comment) async {
    try {
      final unit = await commentRemoteDatabase.addComment(comment);
      return Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getAllComments() async {
    try {
      final List<CommentEntity> comments =
          await commentRemoteDatabase.getAllComments();
      return Right(comments);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
