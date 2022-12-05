import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/ui/colors/colors.dart';

class CommentTile extends StatelessWidget {
  final String txt;
  const CommentTile({required this.txt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TimelineTile(
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.start,
        endChild: CommentCard(txt: txt),
        indicatorStyle: const IndicatorStyle(
          color: GREEN,
          padding: EdgeInsets.all(4),
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String txt;
  const CommentCard({required this.txt, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: WHITE,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(txt),
      ),
    );
  }
}
