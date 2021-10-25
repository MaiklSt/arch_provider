part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends CommentEvent {
  final int postId;
  const InitEvent(this.postId);
}

