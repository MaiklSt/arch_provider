import 'package:arch_provider/core/services/api.dart';
import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/core/viewmodels/login_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());

}