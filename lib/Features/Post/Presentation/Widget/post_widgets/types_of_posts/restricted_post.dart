import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';

import '../../../../../../Core/Constants/constants.dart';
import '../../../../../../Core/Themes/app_colors.dart';
import '../../../../../../Core/Widget/main_app_button.dart';
import '../../../../../Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';

class RestrictedPost extends StatefulWidget {
  const RestrictedPost({super.key});

  @override
  State<RestrictedPost> createState() => _RestrictedPostState();
}

class _RestrictedPostState extends State<RestrictedPost>
    with TickerProviderStateMixin {
  late final GifController _gifController;

  @override
  void initState() {
    _gifController = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          ImageStrings.bluredPost,
          width: size.width,
          height: size.height * 0.5,
          fit: BoxFit.fill,
        ),
        Column(
          children: [
            Image.asset(IconStrings.nft),
            Text(
              'You must Buy NFT to See this post',
              style: theme.textTheme.headlineSmall!.copyWith(
                color: AppColors.natural100,
              ),
              textAlign: TextAlign.center,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: TextButton(
                child: Text(
                  'Click to Buy NFT',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: AppColors.primary300,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
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
                          'Post Information',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: AppColors.natural100),
                        ).setCenter(),
                        const SizedBox(height: 10),
                        Text(
                          'Are you sure you want to view this post?',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ).setCenter(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your balance will be deducted by 100 ',
                              style: theme.textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            Image.asset(
                              IconStrings.nft,
                              height: 16,
                              width: 16,
                            ),
                          ],
                        ).setCenter(),
                        const SizedBox(height: 20),
                        MainAppButton(
                          bgColor: AppColors.primary500,
                          onTap: () {
                            Navigator.pop(ctx);
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              constraints: BoxConstraints(
                                minWidth: size.width,
                                maxHeight: size.height * 0.7,
                              ),
                              builder: (successCtx) => HomeBottomSheet(
                                timeToAutoClose: 4,
                                content: [
                                  Text(
                                    'Post Information',
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(color: AppColors.natural100),
                                  ).setCenter(),
                                  const SizedBox(height: 10),
                                  Gif(
                                    controller: _gifController,
                                    image: const AssetImage(
                                        IconStrings.successLogo2),
                                    height: size.height * 0.2,
                                    fit: BoxFit.fill,
                                    onFetchCompleted: () {
                                      _gifController.reset();
                                      _gifController.forward();
                                    },
                                  ).setCenter(),
                                  Text.rich(
                                    style: theme.textTheme.bodyMedium,
                                    TextSpan(
                                      children: <InlineSpan>[
                                        const TextSpan(
                                            text:
                                                'Your account has been deducted from '),
                                        TextSpan(
                                          text: '100',
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        const TextSpan(
                                            text: '. The current balance is '),
                                        TextSpan(
                                          text: '200',
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Image.asset(
                                              IconStrings.nft,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          alignment:
                                              PlaceholderAlignment.middle,
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ).setCenter(),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Confirm',
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: AppColors.natural100),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ).setHorizontalPadding(context, 0.2)
      ],
    );
  }
}
