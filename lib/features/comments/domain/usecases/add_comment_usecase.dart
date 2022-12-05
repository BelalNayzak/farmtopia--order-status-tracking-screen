import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/errors/failures.dart';
import 'package:farmtopia_task_app/features/comments/domain/repositories/comment_repo.dart';

import '../entities/comment_entity.dart';

class AddCommentUsecase {
  CommentRepo commentRepo;

  AddCommentUsecase(this.commentRepo);

  Future<Either<Failure, Unit>> call(CommentEntity comment) {
    print('xxxxxxx: b');

    return commentRepo.addComment(comment);
  }
}
