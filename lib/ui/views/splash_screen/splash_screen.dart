import 'dart:async';

import 'package:arch_provider/constants/route_paths.dart';
import 'package:arch_provider/core/services/navigation_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progressValue = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 1),
      (_) => setState(
        () {
          progressValue+=0.001;
          print(progressValue);
          if (progressValue > 1) {
            _.cancel();
            locator<NavigationService>().navigateTo(
              RoutePaths.login,
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 239, 94),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 100,
          child: Column(
            children: <Widget>[
              const Text(
                'Splash Screen',
                style: TextStyle(fontSize: 50),
              ),
              LinearProgressIndicator(
                minHeight: 7,
                color: Colors.amber,
                backgroundColor: Colors.transparent,
                value: progressValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
