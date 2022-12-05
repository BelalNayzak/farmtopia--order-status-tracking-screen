import 'package:farmtopia_task_app/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:farmtopia_task_app/features/comments/presentation/widgets/comment_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/comment_model.dart';
import '../../domain/entities/comment_entity.dart';

int flag = 0;

class CommentsSheet extends StatelessWidget {
  const CommentsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _ctrlComment = TextEditingController();

    if (flag == 0) {
      flag++;
      BlocProvider.of<CommentsBloc>(context).add(GetAllCommentsEvent());
    }
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        if (state is CommentsLoaded) {
          print('xxxxxxx: 1');
          if (state.comments.isEmpty) {
            return Image.asset('assets/images/util_no_internet.gif');
          }
          return Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: _buildCommenstListView(state.comments),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextField(
                            controller: _ctrlComment,
                            decoration:
                                InputDecoration(hintText: 'write a comment'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              BlocProvider.of<CommentsBloc>(context).add(
                                AddCommentEvent(
                                  CommentModel(id: 0, text: _ctrlComment.text),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.send,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is CommentSectionError) {
          return Image.asset('assets/images/util_no_internet.gif');
        }
        print('xxxxxxx: 2');
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildCommenstListView(List<CommentEntity> comments) {
    return ListView.separated(
      itemBuilder: (_, i) {
        return CommentTile(txt: comments[i].text);
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: comments.length,
    );
  }
}
