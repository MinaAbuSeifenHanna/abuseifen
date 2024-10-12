import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif/gif.dart';
import 'package:hypelify_v2/Core/Constants/asset_strings.dart';
import 'package:hypelify_v2/Core/Constants/constants.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Helpers/helpers.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/CreateAdvertiserAccount/Domain/UseCases/create_advertiser_useCases.dart';
import 'package:hypelify_v2/Features/CreateAdvertiserAccount/Presentation/Bloc/create_advertiser_account_bloc.dart';

import '../../../../Core/Themes/app_colors.dart';
import '../../Domain/Repository/advertiser_repository.dart';

class CreateAdvertiserAccount extends StatefulWidget {
  CreateAdvertiserAccount({super.key});

  @override
  State<CreateAdvertiserAccount> createState() =>
      _CreateAdvertiserAccountState();
}

class _CreateAdvertiserAccountState extends State<CreateAdvertiserAccount> {
  final PageController pageController = PageController();
  CreateAdvertiserUsecases createAdvertiserUsecases = CreateAdvertiserUsecases(
      repo: DependencyInjectionHelper().sl<AdvertiserRepository>());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController brancdController = TextEditingController();
  TextEditingController weblinkController = TextEditingController();
  File? file;
  String? fileName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);
    // final createAdvertiserAccountBloc =
    //     context.read<CreateAdvertiserAccountBloc>();
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BlocBuilder<CreateAdvertiserAccountBloc,
                    CreateAdvertiserAccountState>(
                builder: (context, state) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GenralAppbar(
                            title: 'Create Advertiser Account',
                            onPressed: () => Navigator.pop(context),
                          ),
                          SizedBox(height: 30.sp),
                          TextFormField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextFormField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextFormField(
                            controller: companyController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Company Name',
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextFormField(
                            controller: brancdController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: 'Brand Name',
                            ),
                          ),
                          SizedBox(height: 15.sp),
                          TextFormField(
                            controller: weblinkController,
                            keyboardType: TextInputType.url,
                            decoration: const InputDecoration(
                              labelText: 'Website Link',
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          GestureDetector(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc', 'docx'],
                              );
                              if (result != null) {
                                setState(() {
                                  file = File(result.files.single.path!);
                                  fileName = file!.path.split('/').last;
                                });
                                print('File Name >>>>>>>> $fileName');
                              }
                            },
                            child: DottedBorder(
                              padding: EdgeInsets.symmetric(vertical: 14.sp),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(4.sp),
                              color: AppColors.natural100,
                              child: file == null
                                  ? Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(IconStrings.upload),
                                        SizedBox(width: 5.sp),
                                        Text(
                                          'Commercial Registration Document ',
                                          style: theme.textTheme.titleMedium,
                                        ),
                                      ],
                                    )
                                  : Center(
                                      child: Text(fileName!),
                                    ),
                            ),
                          ),
                          SizedBox(height: 20.sp),
                          RichText(
                            text: TextSpan(
                              text: 'By Clicking join now you agree with out',
                              children: [
                                TextSpan(
                                  text: ' Terms of use ',
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: const Color(0xff3897F0),
                                    fontSize: 15,
                                  ),
                                )
                              ],
                              style: theme.textTheme.labelMedium,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 20.sp),
                          MainAppButton(
                            bgColor: AppColors.primary500,
                            child: Text(
                              'Join Now',
                              style: theme.textTheme.titleMedium,
                            ),
                            onTap: () {
                              createAdvertiserUsecases
                                  .call(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                companyName: companyController.text,
                                brandName: brancdController.text,
                                weblink: weblinkController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                commercialDocument: file!,
                              )
                                  .then((adv) {
                                adv.fold((l) {}, (r) {
                                  if (r.status == true) {
                                    pageController.animateToPage(
                                      1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.linear,
                                    );
                                  }
                                });
                              });
                            },
                          )
                        ],
                      ),
                    )),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GenralAppbar(
                    title: 'Create Advertiser Account',
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gif(
                          image: const AssetImage(
                            ImageStrings.under_review_gif,
                          ),
                          autostart: Autostart.loop,
                          height: 198,
                          width: 200,
                          onFetchCompleted: () {},
                        ),
                        SizedBox(
                          height: 16.sp,
                        ),
                        Text(
                          'Your account is under review.  Keep an eye on your email to active your account',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.labelLarge,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ).setHorizontalPadding(context, 0.05),
      ),
    );
  }
}
