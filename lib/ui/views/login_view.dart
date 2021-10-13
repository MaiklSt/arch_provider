import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/viewmodels/login_model.dart';
import 'package:arch_provider/ui/shared/app_colors.dart';
import 'package:arch_provider/ui/views/base_view.dart';
import 'package:arch_provider/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arch_provider/locator.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Consumer<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeader(
                    validationMessage: model.errorMessage,
                    controller: controller),
                model.state == ViewState.busy
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () async {
                          var loginSuccess = await model.login(controller.text);
                          if (loginSuccess) {
                            if (loginSuccess) {
                              Navigator.pushNamed(context, '/');
                            }
                          }
                        },
                        child: const Text('Login'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
