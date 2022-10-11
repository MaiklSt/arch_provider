
import 'package:arch_provider/constants/app_colors.dart';
import 'package:arch_provider/constants/text_styles.dart';
import 'package:arch_provider/features/home/business_logic_layer/home_cubit.dart';
import 'package:arch_provider/features/home/presentation_layer/widget/postlist_item.dart';
import 'package:arch_provider/features/post/data_layer/models/post.dart';
import 'package:arch_provider/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).initial();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {     
          return Scaffold(
            floatingActionButton: FloatingActionButton(onPressed: () {
              BlocProvider.of<HomeCubit>(context).testError();            
            }),
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
                  child: Text('Here are all your posts', style: subHeaderStyle),
                ),
                UIHelper.verticalSpaceSmall(),
                state.posts == [] ? const Center(child: CircularProgressIndicator()) : Expanded(child: getPostsUi(state.posts)),
              ],
            ),
          ),
        );
        }
        else {
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
