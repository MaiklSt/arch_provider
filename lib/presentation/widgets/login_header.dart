import 'package:arch_provider/constants/text_styles.dart';
import 'package:arch_provider/presentation/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String? validationMessage;

  const LoginHeader({Key? key,required this.controller, this.validationMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium(),
      const Text('Enter a number between 1 - 10', style: subHeaderStyle),
      LoginTextField(controller),
      validationMessage != ''
          ? Text(validationMessage!, style: const TextStyle(color: Colors.red))
          : Container()
    ]);
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;

  const LoginTextField(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
          decoration: const InputDecoration.collapsed(hintText: 'User Id'),
          controller: controller),
    );
  }
}
