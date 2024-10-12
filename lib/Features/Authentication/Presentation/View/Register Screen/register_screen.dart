import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypelify_v2/Core/Extentions/extentions.dart';
import 'package:hypelify_v2/Core/Functions/app_validator.dart';
import 'package:hypelify_v2/Core/Widget/app_background.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Auth%20Bloc/RegisterBloc/register_bloc.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/View/Login%20Screen/auth_screen.dart';
import '../../../../../Core/Routes/app_navigation.dart';
import '../../../../../Core/Routes/app_routes.dart';
import '../../../../../Core/Themes/app_colors.dart';
import '../../../../../Core/Widget/app_appBar.dart';
import '../../../../../Core/Widget/main_app_button.dart';
import '../../Widget/register_check.dart';
import '../../Widget/register_taps.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final PageController pageController = PageController();

  final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();

  @override
  void deactivate() {
    super.deactivate();
    RegisterBloc.get(context).close();
  }

  @override
  Widget build(BuildContext context) {
    RegisterBloc registerBloc = RegisterBloc.get(context);
    return AuthPage(
      showTermsPolicy: true,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              const AppBackGround(),
              BlocConsumer<RegisterBloc, RegisterState>(
                builder: (context, state) => PageView(
                  controller: pageController,
                  children: [
                    // Page 1
                    Column(
                      children: [
                        GenralAppbar(
                          title: 'Add your email 1/2',
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ).setOnlyPadding(context,.03, 0,.07, .07),
                        const RegisterTaps(index: 0),
                        const SizedBox(height: 35,),
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                          onChanged: (email) => registerBloc.add(OnEmailChangedEvent(email: email)),
                          onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                        ).setHorizontalAndVerticalPadding(context, 0.08, 0.02),
                        MainAppButton(
                          vertical: 0.08,
                          bgColor: AppColors.primary500,
                          onTap: () {
                            if (AppValidator.isEmail(state.email)) {
                              pageController.jumpToPage(1);
                            } else {
                              EasyLoading.showError('Please enter a valid email');
                            }
                          },
                          child: const Text(
                            'Create an account',
                            style: TextStyle(color: Colors.white),
                          ).setCenter(),
                        ),
                      ],
                    ),

                    // Page 2
                    Form(
                      key: passFormKey,
                      child: Column(
                        children: [
                          GenralAppbar(
                            title: 'Create your password 2/2',
                            onPressed: () {
                              pageController.jumpToPage(0);
                            },
                          ).setOnlyPadding(context,.03, 0,.07, .07),
                          const RegisterTaps(index: 1),
                          const SizedBox(height: 35,),
                          TextFormField(
                            controller: passwordController,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "password",
                              suffixIcon: IconButton(
                                onPressed: () => registerBloc.add(TogglePassHiddenEvent()),
                                icon: Icon(
                                  state.passHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                                  color: AppColors.natural300,
                                ),
                              ),
                            ),
                            obscureText: state.passHidden,
                            onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                            onChanged: (password) => registerBloc.add(
                              OnPasswordChangedEvent(password: password),
                            ),
                          ).setHorizontalPadding(context, 0.05,),
             
                          const SizedBox(height: 15),
                          LinearProgressIndicator(
                             borderRadius: BorderRadius.circular(5),
                            value: state.linearValue,
                            color: state.linearValue <= 1 / 4
                                ? Colors.red
                                : state.linearValue <= 2 / 4
                                    ? Colors.amber
                                    : state.linearValue <= 3 / 4
                                        ? Colors.yellow
                                        : Colors.green,
                          ).setHorizontalPadding(context, 0.05),
                          const SizedBox(height: 8),
                          RegisterCheck(
                            value: state.password.length >= 8,
                            text: '8 characters minimum',
                          ),
                          RegisterCheck(
                            value: AppValidator.containsNumeric(state.password),
                            text: 'a number',
                          ),
                          RegisterCheck(
                            value: AppValidator.containsSpecialCharacter(state.password),
                            text: 'a symbol',
                          ),
                          MainAppButton(
                            vertical: 0.08,
                            bgColor: state.linearValue < 1.0 ? Colors.transparent : AppColors.primary500,
                            onTap: state.linearValue < 1.0
                                ? null
                                : () {
                                    //AppNavigation.pushNamed(AppRoutes.successRegisterScreen);
                                    if (passFormKey.currentState!.validate()) {
                                      registerBloc.add(SubmitRegisterEvent());
                                    }
                                  },
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ).setCenter(),
                          ).setVerticalPadding(context, 0.03),
                        ],
                      ),
                    ),
                  ],
                ),
                listener: (context, state) {
                  if (state is SuccessRegisterState) {
                    AppNavigation.pushReplacementNamed(AppRoutes.login);
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
