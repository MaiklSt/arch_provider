import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:flutter/foundation.dart';

/// Represents the state of the view
enum ViewState { idle, busy }

class LoginModel extends ChangeNotifier {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

   Future<bool> login(String userIdText) async {
    setState(ViewState.busy);

    var userId = int.tryParse(userIdText);
    var success =  await _authenticationService.login(userId!.toInt());

    setState(ViewState.idle);
    return success;
  }
}