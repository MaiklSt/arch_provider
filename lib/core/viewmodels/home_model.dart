import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/viewmodels/base_model.dart';
import 'package:arch_provider/locator.dart';

class HomeModel extends BaseModel {
  final Api _api = locator<Api>();

  late List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.busy);
    print('+++');
    print(userId);
    posts = await _api.getPostsForUser(5);
    print('-----');
    setState(ViewState.idle);
  }
}