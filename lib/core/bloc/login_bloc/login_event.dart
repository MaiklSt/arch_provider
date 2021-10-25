part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class AuthEvent extends LoginEvent {
  const AuthEvent(this.userId);
  final String userId;

  // @override
  // List<Object> get props => [];
}
