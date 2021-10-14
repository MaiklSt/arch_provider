import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/core/models/user.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/core/viewmodels/base_model.dart';
import 'package:arch_provider/locator.dart';

class HomeModel extends BaseModel {
  final UserService _userService = locator<UserService>();
  final Api _api = locator<Api>();

  List<Post>? _posts;

  Future getPosts(int userId) async {
    setState(ViewState.busy);
    _posts = await _api.getPostsForUser(userId);
    print(_posts?[1].body);
    setState(ViewState.idle);
  }

  User? get user => _userService.user;
  List<Post> get post => _posts!;
}