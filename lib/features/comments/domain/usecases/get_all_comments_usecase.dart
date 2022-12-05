import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/errors/failures.dart';
import 'package:farmtopia_task_app/features/comments/domain/entities/comment_entity.dart';
import 'package:farmtopia_task_app/features/comments/domain/repositories/comment_repo.dart';

class GetAllCommentsUsecase {
  CommentRepo commentRepo;

  GetAllCommentsUsecase(this.commentRepo);

  Future<Either<Failure, List<CommentEntity>>> call() {
    return commentRepo.getAllComments();
  }
}
