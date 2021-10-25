import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Api _api = locator<Api>();
  final UserService _userService = locator<UserService>();

  List<Post>? _posts;
  String? get userName => _userService.user!.name.toString();
  List<Post>? get post => _posts;

  HomeBloc() : super(const HomeInitial('', [])) {
    on<InitEvent>((event, emit) async {
      String name = _userService.user!.name!;
      emit(HomeInitial(name, const [], isLoading: true));
      await _getPosts(_userService.user!.id!);
      emit(HomeInitial(name, post!, isLoading: false));
    });
  }
  Future _getPosts(int userId) async {
    await Future.delayed(const Duration(milliseconds: 500), () => {});
    _posts = await _api.getPostsForUser(userId);
  }
}


