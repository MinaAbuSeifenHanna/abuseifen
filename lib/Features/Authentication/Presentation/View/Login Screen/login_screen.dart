import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hypelify_v2/Core/Routes/app_routes.dart';
import 'package:hypelify_v2/Core/Themes/app_colors.dart';
import 'package:hypelify_v2/Core/Widget/app_appBar.dart';
import 'package:hypelify_v2/Core/Widget/main_app_button.dart';
import 'package:hypelify_v2/Features/Authentication/Presentation/Widget/or_widget.dart';

import '../../../../../Core/Handler/auth_handler.dart';
import '../../../../../Core/Helpers/dependency_injection_helper.dart';
import '../../Auth Bloc/auth_bloc.dart';
import 'auth_screen.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final authBloc = context.read<AuthBloc>();
    final AuthHandlerInterface authHandler = DependencyInjectionHelper().sl<AuthHandlerInterface>();
    return AuthPage(
      showTermsPolicy: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GenralAppbar(
                  title: "Log into account",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                ...[
                  BlocConsumer<AuthBloc, AuthState>(
                      builder: (context, state) => Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                  ),
                                  onChanged: (email) {
                                    authBloc.add(SetEmailValueEvent(email: email));
                                  },
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return "Email cannot be empty";
                                    }
                                    return null;
                                  },
                                  onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: state.passHidden,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    suffixIcon: IconButton(
                                      onPressed: () => authBloc.add(TogglePassHiddenEvent()),
                                      icon: Icon(
                                        state.passHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                                        color: AppColors.natural300,
                                      ),
                                    ),
                                  ),
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  onChanged: (password) {
                                    authBloc.add(SetPasswordValueEvent(password: password));
                                  },
                                  onTapOutside: (c) => FocusManager.instance.primaryFocus?.unfocus(),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                MainAppButton(
                                  bgColor: AppColors.primary500,
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      if ((state.email?.isNotEmpty ?? false) &&
                                          (state.password?.isNotEmpty ?? false)) {
                                        authBloc.add(
                                          LoginUsingEmailEvent(
                                            email: state.email!,
                                            password: state.password!,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: const Text(
                                    "Log in ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRoutes.resetPasswordScreen);
                                  },
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const ORWidget(),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                ...['Apple', 'Facebook', 'Google'].map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: MainAppButton(
                                      onTap: () {
                                        if (e == 'Google') {
                                          context.read<AuthBloc>().add(GoogleLoginInitiated());
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset('assets/icons/$e.png'),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Continue with $e',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                      listener: (context, state) {
                        if (state is LoginUsingEmailSuccessState) {
                          authHandler.setUserData(state.authResponse.user);
                          authHandler.setToken(state.authResponse.token);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.bottomNavBar,
                            (route) => false,
                          );
                        }
                      })
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
