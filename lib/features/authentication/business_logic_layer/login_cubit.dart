import 'package:arch_provider/features/authentication/data_layer/repositories/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial(''));
  final AuthenticationService _authenticationService = AuthenticationService();
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
      emit(const LoginInitial('', isLoading: true));
      bool success = await _authenticationService.login(userId);
      emit(const LoginInitial('', isLoading: false));
      //emit(LoadedState());
      return success;
    } catch (e) {
      emit(ErrorState('$e'));
      return false;
    }
  }
}
