import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';

class EditProfInfoWidget extends StatelessWidget {
  final bool isHaveTitle;
  final String title;
  final String content;
  final void Function()? onTap;

  const EditProfInfoWidget({
    super.key,
    required this.isHaveTitle,
    required this.title,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isHaveTitle
                ? Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Cairo-Bold',
                      color: AppColors.natural100,
                      fontSize: 15,
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              height: 15,
            ),
            Text(
              content,
              style: textTheme.titleMedium,
            ),
            const Divider(
              color: AppColors.natural100,
            ),
          ],
        ),
      ),
    );
  }
}
