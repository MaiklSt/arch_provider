
import 'package:arch_provider/features/authentication/presentation_layer/login_screen/login_view.dart';
import 'package:arch_provider/features/home/presentation_layer/home_screen/home_view.dart';
import 'package:arch_provider/features/post/data_layer/models/post.dart';
import 'package:arch_provider/features/post/presentation_layer/post_screen/post_view.dart';
import 'package:arch_provider/features/splash/presentation_layer/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      case 'post':
        Post post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
