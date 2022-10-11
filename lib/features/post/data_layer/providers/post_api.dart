
import 'package:arch_provider/core/services/http_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:http/http.dart';

class CommentsApi {
  final HttpHelper _httpHelper = locator<HttpHelper>();
  final String endpoint = 'https://jsonplaceholder.typicode.com';
  Future<Response> getCommentsForPost(int postIds) async {
    Response responseComments = await _httpHelper.request('$endpoint/comments?postId=$postIds');
    return responseComments;
  } 
}