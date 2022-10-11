part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentCubitState extends CommentState {
  final bool isLoaded;
  final List<Comment> comments;
  const CommentCubitState({
    this.comments = const <Comment>[],
    required this.isLoaded,
  });
  @override
  List<Object> get props => [comments, isLoaded];
}
