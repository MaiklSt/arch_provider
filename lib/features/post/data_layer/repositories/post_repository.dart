import 'dart:convert';

import 'package:arch_provider/features/post/data_layer/models/comment.dart';
import 'package:arch_provider/features/post/data_layer/providers/post_api.dart';
import 'package:http/http.dart';

class CommentsRepository {
  final CommentsApi _commentsApi = CommentsApi();
  Future<List<Comment>> getCommentsForPost(int userId) async {
    var comments = <Comment>[];
    Response response = await _commentsApi.getCommentsForPost(userId);
    
    var parsed = json.decode(response.body) as List<dynamic>;

    for (var post in parsed) {
      comments.add(Comment.fromJson(post));
    }  
    return comments;
  }
}