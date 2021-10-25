
import 'package:arch_provider/locator.dart';
import 'package:flutter/material.dart';
import 'package:arch_provider/ui/router.dart' as app;

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: 'login',
      onGenerateRoute: app.Router.generateRoute,
      //home: const LoginView(),
    );
  }
}
