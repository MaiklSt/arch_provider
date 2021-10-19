import 'dart:async';
import 'package:arch_provider/core/models/user.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/locator.dart';

class AuthenticationService {

  final Api _api = locator<Api>();
  final UserService _userService = locator<UserService>();


Future<bool> login(int userId) async {
  User? fetcheduser;
    fetcheduser = await _api.getUserProfile(userId);
    bool hasUser = fetcheduser != null;
    if (hasUser) {
      _userService.setUser(fetcheduser);
    }
    return hasUser;
  }
}