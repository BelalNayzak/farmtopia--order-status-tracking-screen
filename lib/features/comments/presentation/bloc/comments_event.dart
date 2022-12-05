part of 'comments_bloc.dart';

@immutable
abstract class CommentsEvent {}

class GetAllCommentsEvent extends CommentsEvent {}

class AddCommentEvent extends CommentsEvent {
  CommentModel comment;

  AddCommentEvent(this.comment);
}
