// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Features/Post/Presentation/Widget/post_widgets/types_of_posts/post_video.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import '../../../../../../Core/Themes/app_colors.dart';
import '../../../../Domain/Entities/post_entity.dart';
import '../open_post_actions_bar.dart';
import '../post_likes_bar.dart';

class OpenedPost extends StatelessWidget {
  OpenedPost({
    Key? key,
    required this.postDataEntity,
  }) : super(key: key);

  final PageController _controller = PageController();
  final PostDataEntity postDataEntity;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Images slider
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.5,
              child: PageView(
                controller: _controller,
                children: postDataEntity.files!
                    .map(
                      (e) => e.type == 'image'
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                e.path!,
                                width: size.width,
                                height: size.height * 0.5,
                                fit: BoxFit.cover,
                              ),
                            )
                          : PostVideoCard(
                              vedioURL: e.path!,
                            ),
                    )
                    .toList(),
              ),
            ),

            Positioned(
              bottom: 17,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.natural100.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  '1/${postDataEntity.files!.length}',
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(postDataEntity.user!.image!),
                    ),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                  //      color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          postDataEntity.user!.userName!,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.check_circle, color: Colors.blue, size: 16),
                      ],
                    ),
                    Text(
                      postDataEntity.user!.name!,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: AppColors.natural200),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: AppColors.natural100),
              ],
            ).setHorizontalPadding(context, 0.02),

          ],
        ),
        // Post Actions Bar
        Stack(
          alignment: Alignment.center,
          children: [
            OpenPostActionsBar(
              postID: postDataEntity.id!,
            ),
            Align(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: _controller,
                count: postDataEntity.files!.length,
                effect: ScrollingDotsEffect(
                  dotHeight: 8.sp,
                  dotWidth: 8.sp,
                  dotColor: AppColors.natural600,
                  activeDotColor: AppColors.natural100,
                ),
              ),
            )
          ],
        ).setVerticalPadding(context, 0.03),
        const SizedBox(height: 16),
        // PostLikesBar
        PostLikesBar(
          postID: postDataEntity.id!,
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: theme.textTheme.labelMedium,
            children: [
              TextSpan(
                text: postDataEntity.user!.userName!,
                style: theme.textTheme.labelLarge,
              ),
              const TextSpan(text: '  '),
              TextSpan(
                text: postDataEntity.caption,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Post Date
        Text(
          postDataEntity.createdAt!,
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }
}
