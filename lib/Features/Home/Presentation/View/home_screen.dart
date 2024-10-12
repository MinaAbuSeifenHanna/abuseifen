import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/home_appbar.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/home_drawer.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/story_widgets/live_story.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/story_widgets/story_view.dart';
import '../../../Post/Presentation/Widget/post_widgets/types_of_posts/post_widget.dart';
import '../../../Post/Presentation/bloc/Post Bloc/post_bloc_bloc.dart';
import '../../Domain/Entities/story_info.dart';
import '../Widgets/story_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<StoryInfo> stories = [
    StoryInfo(name: 'Your Story', url: ''),
    StoryInfo(name: 'karennne', url: ''),
    StoryInfo(
        name: 'karennne',
        url:
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        isLive: true),
    StoryInfo(
        name: 'zackjohn',
        url:
            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
        isLive: true),
    StoryInfo(name: 'kieron_d', url: ''),
    StoryInfo(name: 'zackjohn', url: ''),
    StoryInfo(name: 'kieron_d', url: ''),
    StoryInfo(name: 'craig_love', url: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // TODO Will add action for the button
            const HomeAppbar()
                .setOnlyPadding(context, 0, 0.02, 0, 0)
                .setHorizontalPadding(context, 0.05),
            // Stories Widget
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: stories
                    .map(
                      (story) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => story.isLive
                                  ? LiveStory(url: story.url)
                                  : const StoryPage(),
                            ),
                          );
                        },
                        child: StoryWidget(
                          story: story,
                        ),
                      ).setHorizontalPadding(context, 0.02),
                    )
                    .toList(),
              ).setHorizontalPadding(context, 0.05),
            ),
            // Home Post
            BlocProvider(
              create: (context) => PostBlocBloc()..add(GetPostData()),
              child: BlocBuilder<PostBlocBloc, PostBlocState>(
                builder: (context, state) {
                  if (state is HavePostsState) {
                    return Expanded(
                      child: state.postDataEntity.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.postDataEntity.length,
                              itemBuilder: (context, index) {
                                return PostWidget(
                                  isBlocked: false,
                                  postDataEntity: state.postDataEntity[index],
                                ).setHorizontalAndVerticalPadding(
                                    context, 0.05, 0.02);
                              },
                            )
                          : const Center(
                              child: Text(
                              'No Data Founded',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                    );
                  } else {
                    return const Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        )
                      ],
                    ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
