part of 'comments_bloc.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState {
  List<CommentModel> comments;

  CommentsLoaded(this.comments);
}

class LoadingState extends CommentsState {}

class CommentAddedState extends CommentsState {}

class CommentSectionError extends CommentsState {
  String errMsg;

  CommentSectionError({required this.errMsg});
}
