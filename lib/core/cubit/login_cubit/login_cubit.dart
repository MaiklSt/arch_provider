import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial(''));
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage = '';

  Future<bool?> login(String userIdText) async {
    int? userId = int.tryParse(userIdText);

    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      emit(LoginInitial(errorMessage));
      Future.delayed(const Duration(seconds: 2), () => {
        errorMessage = '',
        emit(LoginInitial(errorMessage)),
      });
      return false;
    }

    if(userId < 1 || userId > 10) {
      errorMessage = 'use a range from 1 to 10';
      emit(LoginInitial(errorMessage));
      Future.delayed(const Duration(seconds: 2), () => {
        errorMessage = '',
        emit(LoginInitial(errorMessage)),
      });
      return false;
    } 
    try {
      emit(LoginInitial('', isLoading: true));
      bool success = await _authenticationService.login(userId);
      emit(LoginInitial('', isLoading: false));
      //emit(LoadedState());
      return success;
    } catch (e) {
      emit(ErrorState('$e'));
      return false;
    }
  }
}
