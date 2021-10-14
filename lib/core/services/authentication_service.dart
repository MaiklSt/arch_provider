import 'dart:async';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/locator.dart';

class AuthenticationService {

  final Api _api = locator<Api>();
  final UserService _userService = locator<UserService>();


Future<bool> login(int userId) async {
    var fetcheduser = await _api.getUserProfile(userId);
    var hasUser = fetcheduser != null;
    if (hasUser) {
      _userService.setUser(fetcheduser);
    }
    return hasUser;
  }
}