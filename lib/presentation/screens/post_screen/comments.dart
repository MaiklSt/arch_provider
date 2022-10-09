
import 'package:arch_provider/core/cubit/comment_cubit/comment_cubit.dart';
import 'package:arch_provider/core/models/comment.dart';
import 'package:arch_provider/constants/app_colors.dart';
import 'package:arch_provider/presentation/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Comments extends StatefulWidget {
  final int? postId;
  const Comments({Key? key, this.postId}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CommentCubit>(context).fetchComments(widget.postId!);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        if (state is CommentCubitState) {
          return state.isLoaded ? Expanded(
            child: ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (BuildContext context, int index) =>
                  CommentItem(state.comments[index]),
            ),
          ) : const Center(child: CircularProgressIndicator());          
        }
        return Container();
      },
    );
  }
}

class CommentItem extends StatelessWidget {
  final Comment? comment;
  const CommentItem(this.comment, {Key? key}) : super(key: key);

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
