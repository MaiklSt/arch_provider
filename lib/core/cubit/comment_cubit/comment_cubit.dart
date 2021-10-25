import 'package:arch_provider/core/models/comment.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(): super(const CommentCubitState(isLoaded: false));
  final Api _api = locator<Api>();

  late List<Comment> comments;

  Future fetchComments(int postId) async {
    emit(const CommentCubitState(isLoaded: false));
    comments = await _api.getCommentsForPost(postId);
    emit(CommentCubitState(comments: comments, isLoaded: true));
  }
}
