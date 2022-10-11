
import 'package:arch_provider/core/services/http_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:http/http.dart';

class PostApi {
  final HttpHelper _httpHelper = locator<HttpHelper>();
  final String endpoint = 'https://jsonplaceholder.typicode.com';
  Future<Response> getPosts(int userId) async {
    Response responsePosts = await _httpHelper.request('$endpoint/posts?userId=$userId');
    return responsePosts;
  } 
}