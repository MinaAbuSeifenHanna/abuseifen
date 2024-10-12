import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/story_widgets/replay_story.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

import '../../../../../Core/Constants/asset_strings.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final controller = StoryController();

  @override
  Widget build(context) {
    var textTheme = Theme.of(context).textTheme;
    List<StoryItem> storyItems = [
      StoryItem.text(
        title: "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
        backgroundColor: AppColors.primary500,
        roundedTop: true,
        duration: Duration(seconds: 5),
      ),
      StoryItem.pageImage(
        url:
            "https://instagram.fcai2-2.fna.fbcdn.net/v/t51.2885-19/442560569_1205607300818399_8393303602014391286_n.jpg?_nc_ht=instagram.fcai2-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=dWdsrnZG0ccQ7kNvgFG6Zc6&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYCj6nSbCs39iUN2X0ce3xYtVY6F0xDe2WsMYwZMN_FI1A&oe=66AC95B7&_nc_sid=8f1549",
        controller: controller,
        caption: const Text(
          "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black54,
            fontSize: 17,
          ),
        ),
        duration: Duration(seconds: 5),
      ),
      StoryItem.pageImage(
        url:
            "https://instagram.fcai2-2.fna.fbcdn.net/v/t51.2885-19/442560569_1205607300818399_8393303602014391286_n.jpg?_nc_ht=instagram.fcai2-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=dWdsrnZG0ccQ7kNvgFG6Zc6&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYCj6nSbCs39iUN2X0ce3xYtVY6F0xDe2WsMYwZMN_FI1A&oe=66AC95B7&_nc_sid=8f1549",
        controller: controller,
        caption: const Text(
          "Hektas, sektas and skatad",
          style: TextStyle(
            color: Colors.white,
            backgroundColor: Colors.black54,
            fontSize: 17,
          ),
        ),
        duration: Duration(seconds: 5),
      ), /*
      StoryItem.pageImage(
        url:
            'https://instagram.fcai2-2.fna.fbcdn.net/v/t51.2885-19/442560569_1205607300818399_8393303602014391286_n.jpg?_nc_ht=instagram.fcai2-2.fna.fbcdn.net&_nc_cat=111&_nc_ohc=dWdsrnZG0ccQ7kNvgFG6Zc6&edm=AEhyXUkBAAAA&ccb=7-5&oh=00_AYBZn19Ns8X16H0QRDgMhGLdEK9WA8PoQHC-aQfS6hEVmg&oe=66AC5D77&_nc_sid=8f1549',
        controller: controller,
        duration: Duration(seconds: 5),
      ),*/
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: StoryView(
                      controller: controller,
                      onStoryShow: (item, i) {},
                      onComplete: () {
                        Navigator.pop(context);
                      },
                      onVerticalSwipeComplete: (direction) {
                        if (direction == Direction.down) {
                          Navigator.pop(context);
                        } else if (direction == Direction.up) {
                          controller.pause();
                          showHomeBottomSheet(
                            context: context,
                            builder: (c) => HomeBottomSheet(
                              content: [],
                            ),
                          ).whenComplete(() {
                            controller.play();
                          });
                        }
                      },
                      storyItems: storyItems,
                      inline: true,
                      indicatorHeight: IndicatorHeight.medium,
                    ),
                  ),
                  PositionedDirectional(
                    top: 20,
                    start: 10,
                    end: 10,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(ImageStrings.profile),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'craig_love',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppColors.natural100,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '4h',
                          style: textTheme.bodyMedium,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              color: AppColors.natural100.withOpacity(0.18),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.natural100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                      ],
                    ),
                  )
                ],
              ),
            ),
            ReplayStory(),
          ],
        ),
      ),
    );
  }
}
