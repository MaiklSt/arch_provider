import 'dart:async';

import 'package:arch_provider/core/models/user.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/locator.dart';

class AuthenticationService {
  // Inject our Api
  final Api _api = locator<Api>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    User? fetcheduser = await _api.getUserProfile(userId);

    // Check if success
    bool hasUser = fetcheduser != null;

    return hasUser;
  }
}