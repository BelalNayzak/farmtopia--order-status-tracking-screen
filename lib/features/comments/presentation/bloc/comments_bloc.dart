import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/core/strings/strings.dart';
import 'package:meta/meta.dart';

import '../../data/models/comment_model.dart';
import '../../domain/usecases/add_comment_usecase.dart';
import '../../domain/usecases/get_all_comments_usecase.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  AddCommentUsecase addCommentUsecase;
  GetAllCommentsUsecase getAllCommentsUsecase;

  CommentsBloc({
    required this.getAllCommentsUsecase,
    required this.addCommentUsecase,
  }) : super(CommentsInitial()) {
    on<CommentsEvent>((event, state) async {
      if (event is GetAllCommentsEvent) {
        emit(LoadingState());
        Either eitherFailureOrCommentsList = await getAllCommentsUsecase.call();
        eitherFailureOrCommentsList.fold(
          (l_failure) {
            emit(CommentSectionError(errMsg: SERVER_ERROR_MSG));
          },
          (r_commentsList) {
            emit(CommentsLoaded(r_commentsList));
          },
        );
      } else if (event is AddCommentEvent) {
        print('xxxxxxx: b');
        Either eitherFailureOrUnit =
            await addCommentUsecase.call(event.comment);
        eitherFailureOrUnit.fold(
          (l_failure) => emit(CommentSectionError(errMsg: SERVER_ERROR_MSG)),
          (r_unit) => emit(CommentAddedState()),
        );
      }
    });
  }
}
