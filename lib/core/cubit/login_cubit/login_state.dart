part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  LoginInitial(this.errorMessage, {this.isLoading = false});
  final String? errorMessage;
  bool isLoading;
  @override
  List<Object> get props => [errorMessage!, isLoading];  
}
class LoadingState extends LoginState {}

class LoadedState extends LoginState {}

class ErrorState extends LoginState {

  final String errorMessage;
  const ErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
