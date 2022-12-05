import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/errors/failures.dart';
import 'package:farmtopia_task_app/features/comments/domain/entities/comment_entity.dart';

abstract class CommentRepo {
  Future<Either<Failure, List<CommentEntity>>> getAllComments();
  Future<Either<Failure, Unit>> addComment(CommentEntity comment);
}
