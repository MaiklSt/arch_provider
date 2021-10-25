import 'package:arch_provider/core/bloc/comment_bloc/comment_bloc.dart';
import 'package:arch_provider/core/bloc/home_bloc/home_bloc.dart';
import 'package:arch_provider/core/bloc/login_bloc/login_bloc.dart';
import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginBloc());
  locator.registerLazySingleton(() => HomeBloc());
  locator.registerLazySingleton(() => CommentBloc());
}

