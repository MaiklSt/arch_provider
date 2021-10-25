import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial('')) {
    final AuthenticationService _authenticationService =
        locator<AuthenticationService>();
    String errorMessage = '';
    on<AuthEvent>((event, emit) async {
      int? userId = int.tryParse(event.userId);
      if (userId == null) {
        errorMessage = 'Value entered is not a number';
        emit(LoginInitial(errorMessage));
        await Future.delayed(
            const Duration(seconds: 2),
            () => {
                  errorMessage = '',
                  emit(LoginInitial(errorMessage)),
                });
      } else if (userId < 1 || userId > 10) {
        errorMessage = 'use a range from 1 to 10';
        emit(LoginInitial(errorMessage));
        await Future.delayed(
            const Duration(seconds: 2),
            () => {
                  errorMessage = '',
                  emit(LoginInitial(errorMessage)),
                });
      } else {
        try {
          //throw Exception('ERROR');
          emit(const LoginInitial('', isLoading: true));
          await _authenticationService.login(userId);
          emit(const LoginInitial('', isLoading: false));
          emit(SuccessState());
          emit(const LoginInitial('', isLoading: false));
        } catch (e) {
          emit(ErrorState('$e'));
        }
      }
    });
  }
}
