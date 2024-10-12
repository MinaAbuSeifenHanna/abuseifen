import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Widgets/video_player_screen.dart';

import '../../../../../Core/Constants/other_constants.dart';
import '../../../../../Core/Themes/app_colors.dart';

class LiveStory extends StatelessWidget {
  final String url;

  const LiveStory({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var mediaQ = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: VideoPlayerScreen(
                    url: url,
                  ),
                ),
                Positioned(
                  top: mediaQ.viewPadding.top,
                  right: 10,
                  left: 10,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.natural600.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            IconStrings.change_camera,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'End',
                          style: textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SafeArea(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.natural600.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            gradient: OtherConstants.liveLinearGradient,
                          ),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'LIVE',
                              style: textTheme.titleMedium,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: AppColors.natural600.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              children: [
                                Image.asset(IconStrings.views),
                                SizedBox(width: 3),
                                Text(
                                  '1',
                                  style: textTheme.titleMedium,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).setVerticalPadding(context, 0.015),
                ),
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  child: Container(
                    width: mediaQ.size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 180,
                    child: ListView(
                      children: [
                        ...[
                          'We\'re telling your followers that you’ve started a live video.',
                          'Hang on! We\'re telling more followers to join your video.'
                        ].map(
                          (comment) => Text(
                            comment,
                            style: textTheme.titleSmall,
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsetsDirectional.only(end: mediaQ.size.width * 0.1, top: 20),
                          leading: Image.asset(
                            ImageStrings.profile,
                            height: 32,
                          ),
                          title: Text('maxjacobson joined'),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                            decoration: BoxDecoration(
                                color: AppColors.natural500.withOpacity(0.7), borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(IconStrings.wave),
                                SizedBox(width: 10),
                                Text(
                                  'Wave',
                                  style: textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).setHorizontalAndVerticalPadding(context, 0, 0.015),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: mediaQ.viewPadding.bottom),
            decoration: BoxDecoration(color: AppColors.textBlack),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      hintText: 'Comment',
                      suffixIcon: const Icon(Icons.more_horiz, color: AppColors.natural300),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.natural100),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.natural100),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.natural100),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(IconStrings.questions),
                      Image.asset(IconStrings.messanger),
                      Image.asset(IconStrings.emoji),
                      Image.asset(IconStrings.live_face_masks),
                      Image.asset(IconStrings.upload_image),
                    ],
                  ),
                ),
              ],
            ).setHorizontalAndVerticalPadding(context, 0.04, 0.015),
          )
        ],
      ),
    );
  }
}
