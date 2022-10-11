import 'dart:async';
import 'dart:convert';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/features/authentication/data_layer/models/user.dart';
import 'package:arch_provider/features/authentication/data_layer/providers/user_api.dart';
import 'package:arch_provider/locator.dart';
import 'package:http/http.dart';

class AuthenticationService {
  final UserService _userService = locator<UserService>();
  final UserApi _userApi = UserApi();

  Future<bool> login(int userId) async {
    Response response = await _userApi.getUserProfile(userId);

    User? fetcheduser;

    fetcheduser = User.fromJson(json.decode(response.body));

    bool hasUser = fetcheduser != null;
    if (hasUser) {
      _userService.setUser(fetcheduser);
    }
    return hasUser;
  }
}
