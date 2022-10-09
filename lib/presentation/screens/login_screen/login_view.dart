import 'package:arch_provider/core/cubit/login_cubit/login_cubit.dart';
import 'package:arch_provider/core/services/navigation_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:arch_provider/constants/app_colors.dart';
import 'package:arch_provider/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is ErrorState) {
          return Center(
            child: Container(color: Colors.red),
          );
        } else if (state is LoginInitial) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginHeader(
                    validationMessage:
                        BlocProvider.of<LoginCubit>(context).errorMessage,
                    controller: controller,
                  ),
                  state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            var suc = await BlocProvider.of<LoginCubit>(context)
                                .login(controller.text);
                            // if (suc == true) Navigator.pushNamed(context, '/');
                            if (suc == true) {
                              locator<NavigationService>().navigateTo(
                                        '/',
                                      );
                            } 
                          },
                          child: const Text('Login'),
                        ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
