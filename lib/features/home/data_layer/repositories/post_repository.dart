import 'dart:convert';

import 'package:arch_provider/features/home/data_layer/providers/post_api.dart';
import 'package:arch_provider/features/post/data_layer/models/post.dart';
import 'package:http/http.dart';

class PostRepository {
  final PostApi _postApi = PostApi();
  Future<List<Post>> getPostsForUser(int userId) async {
    List<Post> posts = <Post>[];
    Response response = await _postApi.getPosts(userId);
    
    var parsed = json.decode(response.body) as List<dynamic>;

    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }  
    return posts;
  }
}