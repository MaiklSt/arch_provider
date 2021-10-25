part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
  
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {
  final bool isLoaded;
  final List<Comment> comments;
  const CommentInitial({
    this.comments = const <Comment>[],
    required this.isLoaded,
  });
  @override
  List<Object> get props => [comments, isLoaded];
}
