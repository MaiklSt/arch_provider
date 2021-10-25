part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial(this.errorMessage, {this.isLoading = false});
  final String? errorMessage;
  final bool isLoading;
  @override
  List<Object> get props => [errorMessage!, isLoading];  
}

class SuccessState extends LoginState {}

class ErrorState extends LoginState {

  final String errorMessage;
  const ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
