part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial(this.userName, this.posts, {this.isLoading = false});
  final String userName;
  final List<Post> posts;
  final bool isLoading;

  @override
  List<Object> get props => [userName, posts, isLoading];  
}
