import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypelify_v2/Core/Handler/auth_handler.dart';
import 'package:hypelify_v2/Core/Helpers/helpers.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Features/Authentication/Domain/Entities/register_data_response.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/View/Edit%20Profile%20View/edit_data_screen.dart';
import 'package:hypelify_v2/Features/Profile/Presentation/Widgets/Edit%20Profile%20Widget/edit_prof_info_widget.dart';

import '../../../../../Core/Constants/asset_strings.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../Bloc/profile_bloc.dart';
import '../../Widgets/profile_image_builder.dart';

class EditProfileScreen extends StatefulWidget {
  final bool? completeProfile;

  const EditProfileScreen({super.key, this.completeProfile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController userNameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  RegisterDataResponse? userData = DependencyInjectionHelper().sl<AuthHandlerInterface>().getUserData();

  late TextTheme textTheme = Theme.of(context).textTheme;

  @override
  void initState() {
    nameController.text = userData?.name ?? '';
    userNameController.text = userData?.user_name ?? '';
    bioController.text = userData?.bio ?? '';
    addressController.text = userData?.address ?? '';
    genderController.text = userData?.gender ?? '';
    context.read<ProfileBloc>().add(
          GetProfileDataFromCacheEvent(
            name: userData?.name,
            user_name: userData?.user_name,
            bio: userData?.bio,
            address: userData?.address,
            gender: userData?.gender,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double coverHeight = mediaQuery.size.height * 0.15;
    return WillPopScope(
      onWillPop: () {
        if (widget.completeProfile ?? true) {
          Navigator.pop(context);
          return Future.value(true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please complete your profile data first'),
            ),
          );
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              GenralAppbar(
                title: 'Edit Profile',
                onPressed: () {
                  if (widget.completeProfile ?? true) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please complete your profile data first'),
                      ),
                    );
                  }
                },
              ),
              Expanded(
                child: BlocConsumer<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        ProfileImageBuilder(
                          screenSize: mediaQuery.size,
                          coverHeight: coverHeight,
                          profileImage: ImageStrings.profile,
                          isEdit: true,
                        ),
                        EditProfInfoWidget(
                          isHaveTitle: true,
                          title: 'Name',
                          content: state.name,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider<ProfileBloc>.value(
                                  value: context.read<ProfileBloc>(),
                                  child: EditDataScreen(
                                    controller: nameController,
                                    isName: true,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        EditProfInfoWidget(
                          isHaveTitle: true,
                          title: 'User Name',
                          content: state.user_name,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider<ProfileBloc>.value(
                                  value: context.read<ProfileBloc>(),
                                  child: EditDataScreen(
                                    controller: userNameController,
                                    isUserName: true,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        EditProfInfoWidget(
                          isHaveTitle: true,
                          title: 'Bio',
                          content: state.bio,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider<ProfileBloc>.value(
                                  value: context.read<ProfileBloc>(),
                                  child: EditDataScreen(
                                    controller: bioController,
                                    isBio: true,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        EditProfInfoWidget(
                          isHaveTitle: true,
                          title: 'Address',
                          content: state.address,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider<ProfileBloc>.value(
                                  value: context.read<ProfileBloc>(),
                                  child: EditDataScreen(
                                    controller: addressController,
                                    isAddress: true,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        EditProfInfoWidget(
                          isHaveTitle: true,
                          title: 'Gender',
                          content: state.gender,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider<ProfileBloc>.value(
                                  value: context.read<ProfileBloc>(),
                                  child: EditDataScreen(
                                    controller: genderController,
                                    isGender: true,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        MainAppButton(
                          onTap: () {
                            context.read<ProfileBloc>().add(UpdateProfileEvent());
                          },
                          child: Text('Apply', style: textTheme.titleMedium),
                        ),
                        /* EditProfInfoWidget(
                      isHaveTitle: false,
                      title: '',
                      content: 'Switch to content creator account',
                      onTap: () => AppNavigation.pushNamed(AppRoutes.contentCreator),
                    ),
                    EditProfInfoWidget(
                      isHaveTitle: false,
                      title: '',
                      content: 'Subscription Packages',
                      onTap: () => AppNavigation.pushNamed(AppRoutes.subscriptionPackage),
                    ),*/
                      ],
                    );
                  },
                  listener: (context, state) {
                    if (state is GetProfileSuccess) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
