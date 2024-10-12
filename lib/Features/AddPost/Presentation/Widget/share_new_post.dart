import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Functions/app_validator.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/AddPost/Presentation/Bloc/add_post_bloc.dart';
import 'package:hypelify_v2/Features/AddReels/Presentation/Widgets/video_player_screen.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Widget/or_widget.dart';
import 'package:hypelify_v2/Features/Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';

class ShareNewPost extends StatelessWidget {
  final List<File> file;

  ShareNewPost({super.key, required this.file});

  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("ShareNewPost file = $file");
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GenralAppbar(
              title: "Share New Post",
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: BlocBuilder<AddPostBloc, AddPostState>(
                builder: (context, state) {
                  if (state is PostGalleryLoadedState) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Flexible(
                                child: (AppValidator.isVideo(file.firstOrNull?.path??''))
                                    ? VideoPlayerScreen(videoFile: file.first)
                                    : Image.file(
                                  file.firstOrNull!,
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Flexible(
                                child: TextField(
                                  controller: _captionController,
                                  decoration: const InputDecoration(hintText: 'Write a caption...'),
                                  maxLines: 10,
                                  onChanged: (caption) {
                                    //context.read<AddPostBloc>().add(CaptionChangedEvent(caption));
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        'Tag People',
                                        style: textTheme.titleMedium,
                                      ),
                                      leading: Image.asset(IconStrings.people),
                                      trailing: const CircleAvatar(
                                        backgroundColor: AppColors.natural500,
                                        radius: 17,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.natural100,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Add location',
                                        style: textTheme.titleMedium,
                                      ),
                                      leading: Image.asset(IconStrings.location),
                                      trailing: const CircleAvatar(
                                        backgroundColor: AppColors.natural500,
                                        radius: 17,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.natural100,
                                        ),
                                      ),
                                    ),
                                    //Audience
                                    ListTile(
                                      title: Text(
                                        'Audience',
                                        style: textTheme.titleMedium,
                                      ),
                                      leading: Image.asset(IconStrings.audience),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Public',
                                            style: textTheme.titleSmall,
                                          ),
                                          const SizedBox(width: 10),
                                          const CircleAvatar(
                                            backgroundColor: AppColors.natural500,
                                            radius: 17,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppColors.natural100,
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        showHomeBottomSheet(
                                          context: context,
                                          builder: (audienceContext) => HomeBottomSheet(
                                            content: [
                                              Text(
                                                'Audience',
                                                style: textTheme.titleMedium,
                                              ).setCenter(),
                                              Text(
                                                'Who would you like to share your reel with?',
                                                style: textTheme.bodyMedium,
                                              ),
                                              const Divider(color: AppColors.natural300),
                                              ListTile(
                                                title: Text(
                                                  'Public',
                                                  style: textTheme.titleMedium,
                                                ),
                                                leading: Image.asset(IconStrings.public),
                                                contentPadding: EdgeInsets.zero,
                                                trailing: Radio(
                                                  value: true,
                                                  groupValue: true,
                                                  onChanged: (v) {},
                                                  overlayColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                  fillColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'Friends',
                                                  style: textTheme.titleMedium,
                                                ),
                                                leading: Image.asset(IconStrings.friends),
                                                contentPadding: EdgeInsets.zero,
                                                trailing: Radio(
                                                  value: true,
                                                  groupValue: false,
                                                  onChanged: (v) {},
                                                  overlayColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                  fillColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'subscription\'s',
                                                  style: textTheme.titleMedium,
                                                ),
                                                leading: Image.asset(IconStrings.subscriptions),
                                                contentPadding: EdgeInsets.zero,
                                                trailing: Radio(
                                                  value: true,
                                                  groupValue: false,
                                                  onChanged: (v) {},
                                                  overlayColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                  fillColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  'NFT Holders',
                                                  style: textTheme.titleMedium,
                                                ),
                                                leading: Image.asset(IconStrings.nft_holders),
                                                contentPadding: EdgeInsets.zero,
                                                trailing: Radio(
                                                  value: true,
                                                  groupValue: false,
                                                  onChanged: (v) {
                                                    showHomeBottomSheet(
                                                      context: context,
                                                      builder: (nftHolderContext) => HomeBottomSheet(
                                                        content: [
                                                          Text(
                                                            'NFT Holder',
                                                            style: textTheme.titleMedium,
                                                          ).setCenter(),
                                                          SizedBox(height: 10.sp),
                                                          Text(
                                                            'Please enter the NFT Price',
                                                            style: textTheme.bodyMedium,
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Row(
                                                            children: [10, 20, 30, 50, 80, 100]
                                                                .map(
                                                                  (e) => Expanded(
                                                                    child: DottedBorder(
                                                                      borderType: BorderType.RRect,
                                                                      radius: Radius.circular(8.sp),
                                                                      color: AppColors.natural100,
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text('$e'),
                                                                          Image.asset(
                                                                            IconStrings.nft,
                                                                            width: 16.sp,
                                                                            height: 16.sp,
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ).setHorizontalPadding(context, 0.01),
                                                                  ),
                                                                )
                                                                .toList(),
                                                          ),
                                                          const ORWidget(),
                                                          const TextField(
                                                            keyboardType: TextInputType.number,
                                                            decoration: InputDecoration(
                                                              hintText: 'Add Your Price',
                                                            ),
                                                          ),
                                                          SizedBox(height: 10.sp),
                                                          MainAppButton(
                                                            bgColor: AppColors.primary500,
                                                            child: Text(
                                                              'Done',
                                                              style: textTheme.titleMedium,
                                                            ),
                                                            onTap: () => Navigator.pop(nftHolderContext),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  overlayColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                  fillColor:
                                                      const WidgetStatePropertyAll(AppColors.natural100),
                                                ),
                                              ),
                                              SizedBox(height: 10.sp),
                                              MainAppButton(
                                                bgColor: AppColors.primary500,
                                                child: Text(
                                                  'Done',
                                                  style: textTheme.titleMedium,
                                                ),
                                                onTap: () {},
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: MainAppButton(
                                child: Text('Save to draft'),
                              ),
                            ),
                            SizedBox(width: 20.sp),
                            Expanded(
                              child: MainAppButton(
                                bgColor: AppColors.primary500,
                                child: const Text('Share'),
                                onTap: () async {
                                  context.read<AddPostBloc>().add(
                                        AddPostActionEvent(
                                          audience: state.audience,
                                          caption: state.caption,
                                          videoFile: file,
                                          context: context,
                                        ),
                                      );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ).setHorizontalAndVerticalPadding(context, 16.sp, 10.sp, enableMediaQuery: false),
      ),
    );
  }
}
