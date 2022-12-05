import 'package:farmtopia_task_app/features/comments/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({required super.text, required super.id});

  factory CommentModel.fromjson(Map<String, dynamic> json) {
    return CommentModel(id: json['id'], text: json['text']);
  }

  Map<String, dynamic> tojson() {
    return {'text': text};
  }
}
