import 'package:arch_provider/core/models/user.dart';

class UserService {

  User? _user;

  User? get user => _user;

void setUser(User? user) async {  
    var hasUser = user != null;
    if (hasUser) {
      _user = user!;
    }
  }
}