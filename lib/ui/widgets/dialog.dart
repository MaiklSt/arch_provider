import 'package:arch_provider/core/services/navigation_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:flutter/material.dart';

class Dialog {
  Future<void> showErrorDialog() async {
    await showDialog(
      context: locator<NavigationService>().navigatorKey.currentContext!,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height / 4,
            child: const Text('ERROR', style: TextStyle(fontSize: 50),),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(String message) {
    return ScaffoldMessenger.of(locator<NavigationService>().navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
