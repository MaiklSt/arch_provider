

import 'package:arch_provider/features/post/data_layer/models/comment.dart';
import 'package:arch_provider/features/post/data_layer/repositories/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(): super(const CommentCubitState(isLoaded: false));

  final CommentsRepository _commentsRepository = CommentsRepository();

  late List<Comment> comments;

  Future fetchComments(int postId) async {
    emit(const CommentCubitState(isLoaded: false));
    comments = await _commentsRepository.getCommentsForPost(postId);
    emit(CommentCubitState(comments: comments, isLoaded: true));
  }
}
