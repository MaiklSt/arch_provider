import 'package:arch_provider/core/bloc/login_bloc/login_bloc.dart';
import 'package:arch_provider/locator.dart';
import 'package:arch_provider/ui/shared/app_colors.dart';
import 'package:arch_provider/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();
  final LoginBloc _loginBloc = locator<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pushNamed(context, '/');
        }
      },
      builder: (context, state) {
        if (state is ErrorState) {
          return Center(
            child: Stack(
              children: [
                Container(color: Colors.red),
                Center(child: Text(state.errorMessage, style: const TextStyle(color: Colors.white))),
              ],
            ),
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
                    validationMessage: state.errorMessage,
                    controller: controller,
                  ),
                  state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            _loginBloc.add(AuthEvent(controller.text));

                            //var suc = await BlocProvider.of<LoginCubit>(context).login(controller.text);
                            // if (suc == true) Navigator.pushNamed(context, '/');
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
