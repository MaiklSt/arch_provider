import 'package:arch_provider/features/authentication/data_layer/models/user.dart';

class UserService {

  User? _user;

  User? get user => _user;

void setUser(User? user) async {
    bool hasUser = user != null;
    if (hasUser) {
      _user = user;
    }
  }
}