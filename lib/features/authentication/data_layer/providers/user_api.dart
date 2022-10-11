
import 'package:arch_provider/core/services/http_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:http/http.dart';

class UserApi {
  final HttpHelper _httpHelper = locator<HttpHelper>();
  final String endpoint = 'https://jsonplaceholder.typicode.com';
  Future<Response> getUserProfile(int userId) async {
    Response responseUser = await _httpHelper.request('$endpoint/users/$userId');
    return responseUser;
  } 
}

