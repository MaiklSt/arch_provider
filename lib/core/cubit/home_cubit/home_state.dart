part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial(this.userName, this.posts);
  final String userName;
  final List<Post> posts;
//  final bool? postLoading;
  @override
  List<Object> get props => [userName, posts];  
}
