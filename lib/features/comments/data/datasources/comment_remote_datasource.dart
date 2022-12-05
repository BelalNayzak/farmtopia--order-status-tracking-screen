import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:farmtopia_task_app/features/comments/data/models/comment_model.dart';
import 'package:farmtopia_task_app/features/comments/domain/entities/comment_entity.dart';
import 'package:http/http.dart' as http;

import '../../../../core/errors/exceptions.dart';
import '../../../../core/strings/strings.dart';

abstract class CommentRemoteDatabase {
  Future<Unit> addComment(CommentEntity comment);
  Future<List<CommentModel>> getAllComments();
}

class CommentRemoteDatabaseImpl implements CommentRemoteDatabase {
  final http.Client client;

  CommentRemoteDatabaseImpl(this.client);

  @override
  Future<Unit> addComment(CommentEntity comment) async {
    final url = Uri.parse('$BASE_URL/comments/-NITmo5ds4SCjRNk7UgJ.json');
    final response = await client.post(
      url,
      body: {
        'id': comment.id,
        'text': comment.text,
      },
    );

    if (response.statusCode == 201) {
      return Future.value(Unit as Unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CommentModel>> getAllComments() async {
    final url = Uri.parse('$BASE_URL/comments.json');
    // final url = Uri.parse('$BASE_URL/comments/-NITmo5ds4SCjRNk7UgJ.json');
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 && response != null) {
      List l = [];
      Map<String, dynamic> decodedJson = convert.json.decode(response.body);
      final commentsAsJson = decodedJson.values;
      print('^^^^^^ ${commentsAsJson}');
      List<CommentModel> comments =
          commentsAsJson.map((c) => CommentModel.fromjson(c)).toList();
      return Future.value(comments);
      // return Future.value([]);
    } else {
      throw ServerException();
    }
  }
}
