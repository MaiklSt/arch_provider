import 'package:arch_provider/locator.dart';
import 'package:arch_provider/ui/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: const LoginView(),
        );
  }
}
