import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/ui/views/home_screen/home_view.dart';
import 'package:arch_provider/ui/views/login_screen/login_view.dart';
import 'package:arch_provider/ui/views/post_screen/post_view.dart';
import 'package:flutter/material.dart';

const String initialRoute = "login";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
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
