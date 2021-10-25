import 'package:arch_provider/core/models/comment.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(const CommentInitial(isLoaded: false)) {
    on<InitEvent>((event, emit) async {
      final Api _api = locator<Api>();
      late List<Comment> comments;

      emit(const CommentInitial(isLoaded: false));
      comments = await _api.getCommentsForPost(event.postId);
      await Future.delayed(const Duration(milliseconds: 500), () => {});
      emit(CommentInitial(comments: comments, isLoaded: true));
    });
  }
}
