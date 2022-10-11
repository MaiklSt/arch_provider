import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpHelper {
  var client = http.Client();
  Future<Response> request(String url) async {
    return await client.get(Uri.parse(url));
  }
}
