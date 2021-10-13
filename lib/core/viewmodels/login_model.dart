import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/core/viewmodels/base_model.dart';
import 'package:arch_provider/locator.dart';


class LoginModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String? errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.busy);

    var userId = int.tryParse(userIdText);

    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.idle);
    return success;
  }
}