// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';

import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import '../../../../../Core/Constants/constants.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_separator.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../../../Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';
import '../../bloc/Post Bloc/post_bloc_bloc.dart';
import '../post_comment_widget/post_comment_widget.dart';

class OpenPostActionsBar extends StatelessWidget {
  final int postID;

  const OpenPostActionsBar({
    Key? key,
    required this.postID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return BlocBuilder<PostBlocBloc, PostBlocState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(IconStrings.love),
                ),
                SizedBox(width: 10.sp),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColors.scaffoldBackgroundColor,
                        isScrollControlled: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        )),
                        builder: (ctx) {
                          return PostCommentWidget(
                            postID: postID,
                          );
                        });
                  },
                  child: Image.asset(IconStrings.comment),
                ),
                SizedBox(width: 10.sp),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(IconStrings.share),
                ),
                SizedBox(width: 10.sp),
                GestureDetector(
                  onTap: () {
                    //show gift bottom sheet below the open posts
                    showHomeBottomSheet(
                      context: context,
                      builder: (ctx) => HomeBottomSheet(
                        stackedWidget: PositionedDirectional(
                          bottom: 0,
                          end: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(ctx);
                              // show recharge bottom sheet
                              showHomeBottomSheet(
                                context: context,
                                builder: (rechargeCtx) => HomeBottomSheet(
                                  content: [
                                    Text(
                                      'Recharge',
                                      style: theme.textTheme.titleMedium,
                                    ).setCenter(),
                                    SizedBox(
                                      height: 20.sp,
                                    ),
                                    GridView.count(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1,
                                      children: [
                                        ...List.generate(8,
                                                (i) => Random().nextInt(1000))
                                            .map((number) {
                                          return InkWell(
                                            onTap: () {},
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          AppColors.primary500),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.sp)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text.rich(
                                                    style: theme
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            color: AppColors
                                                                .natural100),
                                                    TextSpan(
                                                      children: <InlineSpan>[
                                                        TextSpan(
                                                            text: number
                                                                .toString()),
                                                        WidgetSpan(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 4.0),
                                                            child: Image.asset(
                                                              IconStrings
                                                                  .hypeXCoin,
                                                              width: 13.sp,
                                                              height: 13.sp,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          alignment:
                                                              PlaceholderAlignment
                                                                  .middle,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    '10\$',
                                                    style: theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .natural100),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                        InkWell(
                                          onTap: () {
                                            // TODO show Recharge Manual bottom sheet
                                            Navigator.pop(rechargeCtx);
                                            showHomeBottomSheet(
                                              context: context,
                                              builder: (rechargeManualCtx) =>
                                                  HomeBottomSheet(
                                                content: [
                                                  Text(
                                                    'Recharge Manual',
                                                    style: theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .natural100),
                                                  ).setCenter(),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    'Enter the desired amount to see the corresponding currency value',
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .natural100),
                                                  ),
                                                  const SizedBox(height: 20),

                                                  // Amount
                                                  const Text('Amount'),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      Image.asset(IconStrings
                                                          .unitedStates),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        'USD',
                                                        style: theme.textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .natural100),
                                                      ),
                                                      const Spacer(),
                                                      const Flexible(
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Amount'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),

                                                  // Separator
                                                  Row(
                                                    children: [
                                                      const Expanded(
                                                        child: AppSeparator(
                                                          color: AppColors
                                                              .natural100,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.all(
                                                            14.sp),
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    5.sp),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: AppColors
                                                              .primary500,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.asset(
                                                            IconStrings
                                                                .transfer),
                                                      ),
                                                      const Expanded(
                                                        child: AppSeparator(
                                                          color: AppColors
                                                              .natural100,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // Converted Amount
                                                  const Text(
                                                      'Converted Amount'),
                                                  const SizedBox(height: 5),
                                                  Row(
                                                    children: [
                                                      Image.asset(IconStrings
                                                          .hypeXCoin),
                                                      const SizedBox(width: 10),
                                                      Text(
                                                        'HypeX',
                                                        style: theme.textTheme
                                                            .titleLarge!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .natural100),
                                                      ),
                                                      const Spacer(),
                                                      const Flexible(
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Amount'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                  MainAppButton(
                                                    onTap: () {},
                                                    bgColor:
                                                        AppColors.primary500,
                                                    child: Text(
                                                      'Recharge',
                                                      style: theme.textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .natural100),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: AppColors.primary500,
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                            ),
                                            child: Text(
                                              'Recharge\nManual',
                                              style: theme.textTheme.labelLarge!
                                                  .copyWith(
                                                      color:
                                                          AppColors.natural100),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              softWrap: true,
                                            ).setCenter(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    MainAppButton(
                                      onTap: () {},
                                      bgColor: AppColors.primary500,
                                      child: Text(
                                        'Recharge',
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(
                                                color: AppColors.natural100),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text.rich(
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: AppColors.natural100,
                                ),
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Image.asset(
                                          IconStrings.hypeXCoin,
                                          width: 16,
                                        ),
                                      ),
                                      alignment: PlaceholderAlignment.middle,
                                    ),
                                    const TextSpan(text: ' Recharge'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        content: [
                          Text(
                            "Gift",
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: AppColors.natural100),
                          ).setCenter(),
                          const SizedBox(height: 10),
                          Text.rich(
                            style: theme.textTheme.bodyMedium,
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Your Balance:',
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(text: ' 20 '),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Image.asset(
                                      IconStrings.hypeXCoin,
                                      width: 16,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                              ],
                            ),
                          ),
                          GridView.count(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 1.5,
                            childAspectRatio: 3 / 5,
                            children: List.filled(9, IconStrings.gif)
                                .map((imagePath) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pop(ctx);
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    constraints: BoxConstraints(
                                      minWidth: size.width,
                                      maxHeight: size.height * 0.7,
                                    ),
                                    builder: (ctx) => HomeBottomSheet(
                                      content: [
                                        Text(
                                          'Recharge',
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  color: AppColors.natural100),
                                        ).setCenter(),
                                        const SizedBox(height: 10),
                                        Image.asset(
                                          IconStrings.hypeXCoin,
                                          height: 61,
                                          fit: BoxFit.fill,
                                        ).setCenter(),
                                        const SizedBox(height: 10),
                                        Text(
                                          "Time to recharge?\nYou need to more HypeX to send this gift!",
                                          style: theme.textTheme.titleMedium!
                                              .copyWith(
                                                  color: AppColors.natural100),
                                          textAlign: TextAlign.center,
                                        ).setCenter(),
                                        const SizedBox(height: 20),
                                        const MainAppButton(
                                          bgColor: AppColors.primary500,
                                          child: Text('Recharge'),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(

                                      'assets/icons/gift.gif',
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      'Gift One',
                                      style: theme.textTheme.titleMedium!
                                          .copyWith(
                                              color: AppColors.natural100),
                                    ),
                                    Text.rich(
                                      style: theme.textTheme.bodyMedium,
                                      TextSpan(
                                        children: <InlineSpan>[
                                          const TextSpan(text: '5'),
                                          WidgetSpan(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Image.asset(
                                                IconStrings.hypeXCoin,
                                                width: 18,
                                              ),
                                            ),
                                            alignment:
                                                PlaceholderAlignment.middle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text('10\$'),
                                  ],
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    );
                  },
                  child: Image.asset(IconStrings.giftBox),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(IconStrings.save),
            ),
          ],
        );
      },
    );
  }
}
