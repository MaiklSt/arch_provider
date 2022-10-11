
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/features/home/data_layer/repositories/post_repository.dart';
import 'package:arch_provider/features/post/data_layer/models/post.dart';
import 'package:arch_provider/locator.dart';
import 'package:arch_provider/shared/dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super (const HomeInitial('', []));
  final UserService _userService = locator<UserService>();
  final PostRepository _postRepository = PostRepository();

  List<Post>? _posts;

  String? get userName => _userService.user!.name.toString();
  List<Post>? get post => _posts;

  void initial() async {
    emit(HomeInitial(userName!, const []));
    await _getPosts(_userService.user!.id!);
    emit(HomeInitial(userName!, post!));
  }
  

  Future _getPosts(int userId) async {
    _posts = await _postRepository.getPostsForUser(userId);
  }

  void testError() => Dialog().showErrorDialog();

}
