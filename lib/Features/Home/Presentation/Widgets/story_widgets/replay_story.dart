import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/story_widgets/reply_field.dart';

class ReplayStory extends StatelessWidget {
  const ReplayStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.black,
      child: Row(
        children: [
          const Expanded(
            child: ReplayField(),
          ),
          const SizedBox(width: 20),
          Image.asset(
            IconStrings.messages,
            color: AppColors.natural100,
          ),
          const SizedBox(width: 20),
          const Icon(Icons.more_horiz, color: AppColors.natural100),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
