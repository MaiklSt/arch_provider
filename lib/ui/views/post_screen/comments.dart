import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/models/comment.dart';
import 'package:arch_provider/core/viewmodels/comments_model.dart';
import 'package:arch_provider/ui/shared/app_colors.dart';
import 'package:arch_provider/ui/shared/ui_helpers.dart';
import 'package:arch_provider/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final int? postId;
  Comments({this.postId});

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
      onModelReady: (model) => model.fetchComments(postId!),
      builder: (context, model, child) => model.state == ViewState.busy
          ? const Center(child: CircularProgressIndicator())
          : Expanded(
            child: ListView.builder(
              itemCount: model.comments.length,
              itemBuilder: (BuildContext context, int index) => CommentItem(model.comments[index]),
            ),
              // child: ListView(
              //   //children: [Text('${model.comments[2].email}')],
              //   children: model.comments.map((comment) => CommentItem(comment)).toList(),
              // ),
            ),
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment? comment;
  CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment!.name!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            comment!.email!,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment!.body!),
        ],
      ),
    );
  }
}
