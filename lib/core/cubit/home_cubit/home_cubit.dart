import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:arch_provider/presentation/widgets/dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super (const HomeInitial('', []));
  final UserService _userService = locator<UserService>();
  final Api _api = locator<Api>();

  List<Post>? _posts;

  String? get userName => _userService.user!.name.toString();
  List<Post>? get post => _posts;

  void initial() async {
    emit(HomeInitial(userName!, const []));
    await _getPosts(_userService.user!.id!);
    emit(HomeInitial(userName!, post!));
  }
  

  Future _getPosts(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }

  void testError() => Dialog().showErrorDialog();

}
