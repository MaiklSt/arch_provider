import 'package:arch_provider/core/enums/viewstate.dart';
import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/core/models/user.dart';
import 'package:arch_provider/core/viewmodels/home_model.dart';
import 'package:arch_provider/ui/shared/app_colors.dart';
import 'package:arch_provider/ui/shared/text_styles.dart';
import 'package:arch_provider/ui/shared/ui_helpers.dart';
import 'package:arch_provider/ui/views/base_view.dart';
import 'package:arch_provider/ui/widgets/postlist_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        //print();
        model.getPosts(Provider.of<User>(context).id!);
      },
      builder: (context, model, child) {
        print(model.posts);
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(),
          body: model.state == ViewState.busy
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpaceLarge(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Welcome ${Provider.of<User>(context).name}',
                          style: headerStyle,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Here are all your posts',
                            style: subHeaderStyle),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Expanded(child: getPostsUi(model.posts)),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, 'post', arguments: posts[index]);
          },
        ),
      );
}
