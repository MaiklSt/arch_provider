import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/models/comment.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/viewmodels/base_model.dart';
import 'package:arch_provider/locator.dart';

class CommentsModel extends BaseModel {
  final Api _api = locator<Api>();

  late List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.idle);
  }
}