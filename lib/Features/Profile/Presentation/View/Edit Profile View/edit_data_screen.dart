import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Routes/app_navigation.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/Bloc/profile_bloc.dart';

class EditDataScreen extends StatefulWidget {
  final bool? isName;
  final bool? isUserName;
  final bool? isBio;
  final bool? isAddress;
  final bool? isGender;
  final TextEditingController controller;

  const EditDataScreen({
    super.key,
    this.isName = false,
    this.isUserName = false,
    this.isBio = false,
    this.isAddress = false,
    this.isGender = false,
    required this.controller,
  });

  @override
  State<EditDataScreen> createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  static const List<String> genderList = ['Male', 'Female'];
  String genderGroup = genderList[0];

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            print("object ${state.gender}");
            return Column(
              children: [
                GenralAppbar(
                  title: widget.isName == true
                      ? 'Name'
                      : widget.isUserName == true
                          ? 'User Name'
                          : widget.isBio == true
                              ? 'Bio'
                              : widget.isAddress == true
                                  ? 'Address'
                                  : 'Gender',
                  onPressed: () {
                    AppNavigation.pop();
                  },
                  isHaveAction: true,
                  action: GestureDetector(
                    onTap: () => AppNavigation.pop(),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: 'Cairo-Bold',
                        color: AppColors.natural100,
                      ),
                    ).setCenter().setHorizontalPadding(context, 0.02),
                  ),
                ),
                widget.isGender == true
                    ? Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'This wont be part of your public profile',
                              style: TextStyle(
                                color: AppColors.natural100,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView.separated(
                                itemCount: genderList.length,
                                separatorBuilder: (context, index) => const Divider(
                                  color: AppColors.natural100,
                                ),
                                itemBuilder: (context, index) {
                                  return RadioListTile<String>(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    groupValue: state.gender,
                                    title: Text(
                                      genderList[index],
                                      style: const TextStyle(
                                        color: AppColors.natural100,
                                      ),
                                    ),
                                    value: genderList[index].toLowerCase(),
                                    activeColor: AppColors.natural100,
                                    hoverColor: AppColors.natural100,
                                    onChanged: (String? val) {
                                      if (val != null) {
                                        profileBloc.add(OnChangeGenderEvent(gender: val));
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ).setHorizontalAndVerticalPadding(context, 0.06, 0.02),
                      )
                    : Expanded(
                        child: Column(
                        children: [
                          TextFormField(
                            controller: widget.controller,
                            decoration: InputDecoration(
                              labelText: widget.isName == true
                                  ? 'Name'
                                  : widget.isUserName == true
                                      ? 'User Name'
                                      : widget.isBio == true
                                          ? 'Bio'
                                          : widget.isAddress == true
                                              ? 'Address'
                                              : 'Gender',
                            ),
                            onChanged: (value) {
                              if (widget.isName == true) {
                                profileBloc.add(OnChangeNameEvent(name: value));
                              } else if (widget.isUserName == true) {
                                profileBloc.add(OnChangeUserNameEvent(user_name: value));
                              } else if (widget.isBio == true) {
                                profileBloc.add(OnChangeBioEvent(bio: value));
                              } else if (widget.isAddress == true) {
                                profileBloc.add(OnChangeAddressEvent(address: value));
                              }
                            },
                            onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                          ),
                        ],
                      ).setHorizontalAndVerticalPadding(context, 0.06, 0.02))
              ],
            );
          },
        ),
      ),
    );
  }
}
