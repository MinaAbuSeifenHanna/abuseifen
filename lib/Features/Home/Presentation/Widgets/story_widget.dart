import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Features/Home/Domain/Entities/story_info.dart';

import '../../../../Core/Themes/app_colors.dart';

class StoryWidget extends StatelessWidget {
  final StoryInfo story;
  final Widget? child;

  const StoryWidget({
    super.key,
    required this.story,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: child != null ? 68 : null,
          height: child != null ? 68 : null,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(
              color:story.isLive? AppColors.errorColor: AppColors.natural400,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: child ??
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(ImageStrings.profile), // replace with your image asset
              ),
        ),
        Text(
          story.name,
          style: theme.textTheme.bodyMedium,
        )
      ],
    );
  }
}
