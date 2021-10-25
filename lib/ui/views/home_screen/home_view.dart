import 'package:arch_provider/core/bloc/home_bloc/home_bloc.dart';
import 'package:arch_provider/core/models/post.dart';
import 'package:arch_provider/locator.dart';
import 'package:arch_provider/ui/shared/app_colors.dart';
import 'package:arch_provider/ui/shared/text_styles.dart';
import 'package:arch_provider/ui/shared/ui_helpers.dart';
import 'package:arch_provider/ui/widgets/postlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeBloc _homeBloc = locator<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    _homeBloc.add(InitEvent());
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        if (state is HomeInitial) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${state.userName}',
                      style: headerStyle,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(child: getPostsUi(state.posts)),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
        ),
      );
}
