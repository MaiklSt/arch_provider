import 'package:arch_provider/core/cubit/home_cubit/home_cubit.dart';
import 'package:arch_provider/core/cubit/login_cubit/login_cubit.dart';
import 'package:arch_provider/core/models/user.dart';
import 'package:arch_provider/core/services/authentication_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:flutter/material.dart';
import 'package:arch_provider/ui/router.dart' as app;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: app.Router.generateRoute,
        //home: const LoginView(),
      ),
    );
  }
}
