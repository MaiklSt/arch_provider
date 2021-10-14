import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/core/services/user_service.dart';
import 'package:arch_provider/locator.dart';
import 'package:arch_provider/ui/shared/app_colors.dart';
import 'package:arch_provider/ui/shared/text_styles.dart';
import 'package:arch_provider/ui/shared/ui_helpers.dart';
import 'package:arch_provider/ui/views/post_screen/comments.dart';
import 'package:flutter/material.dart';


class PostView extends StatelessWidget {
  final Post post;

  PostView({Key? key, required this.post}) : super(key: key);
  final UserService _userService = locator<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             UIHelper.verticalSpaceLarge(),
             Text(post.title!, style: headerStyle),
            Text(
              'by ${_userService.user?.name}',
              style: const TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body!),
            SizedBox(
              height: 20,
            ),
            Comments(postId: post.id!)
          ],
        ),
      ),
    );
  }
}
