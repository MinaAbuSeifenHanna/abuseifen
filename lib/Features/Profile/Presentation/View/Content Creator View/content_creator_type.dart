import 'package:flutter/material.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';

import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../../../Home/Presentation/Widgets/popups_bottom_sheets/home_bottom_sheet.dart';

class ContentCreatorType extends StatefulWidget {
  const ContentCreatorType({super.key});

  @override
  State<ContentCreatorType> createState() => _ContentCreatorTypeState();
}

class _ContentCreatorTypeState extends State<ContentCreatorType> {
  static const typeList = [
    'Pubic Figure',
    'Artist',
    'Musician/band',
    'Blogger',
    'Clothing',
    'Community',
    'Digital creator'
  ];
  String groupVal = typeList[0];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          GenralAppbar(
            title: '',
            onPressed: () => AppNavigation.pop(),
          ),
          Expanded(
              child: Column(
            children: [
              const Text(
                'What best Describes you?',
                style: TextStyle(
                  fontFamily: 'Cairo-Bold',
                  fontSize: 20,
                ),
              ).setCenter(),
              Expanded(
                child: ListView.builder(
                  itemCount: typeList.length,
                  itemBuilder: (context, index) {
                    return RadioListTile<String>(
                      controlAffinity: ListTileControlAffinity.trailing,
                      groupValue: groupVal,
                      title: Text(
                        typeList[index],
                        style: const TextStyle(
                          color: AppColors.natural100,
                        ),
                      ),
                      value: typeList[index],
                      activeColor: AppColors.natural100,
                      hoverColor: AppColors.natural100,
                      onChanged: (String? val) {
                        setState(() {
                          groupVal = val!;
                        });
                      },
                    );
                  },
                ).setHorizontalAndVerticalPadding(context, 0.06, 0.02),
              ),
              const Spacer(),
              MainAppButton(
                vertical: 0.08,
                horizontal: 0.02,
                bgColor: AppColors.primary500,
                child: const Text(
                  'Continue',
                ),
                onTap: () {
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
                          'Switch to a Content Creator account?',
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: AppColors.natural100),
                        ).setCenter(),
                        const SizedBox(height: 10),
                        Text(
                          'Switching to a content creator account makes your profile public. Anyone will be able to see your photos and video on hypelify. You will no longer need to approve followers. Any pending follow request will be automatically approved',
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.left,
                        ).setCenter(),
                        const SizedBox(height: 20),
                        MainAppButton(
                          bgColor: AppColors.primary500,
                          onTap: () {
                            Navigator.pop(ctx);
                            AppNavigation.pop();
                          },
                          child: Text(
                            'OK',
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: AppColors.natural100),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ))
        ],
      ),
    ));
  }
}
