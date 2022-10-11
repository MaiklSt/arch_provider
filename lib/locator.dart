
import 'package:arch_provider/core/services/http_service.dart';
import 'package:arch_provider/core/services/navigation_service.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => HttpHelper());
  locator.registerLazySingleton(() => NavigationService());
}