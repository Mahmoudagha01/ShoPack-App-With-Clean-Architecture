import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/local/shared_preference.dart';
import '../../../../core/utilities/endpoints.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/routes.dart';
import '../../../../core/utilities/strings.dart';
import '../bloc/login_bloc.dart';
import '../widgets/alert_snackbar.dart';
import '../widgets/mainbutton.dart';
import '../widgets/maintextformfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: kHeight(context) * 0.1),
                  Row(
                    children: [
                      Text(
                        AppStrings.login,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.dark),
                      ),
                    ],
                  ),
                  SizedBox(height: kHeight(context) * 0.1),
                  MainTFF(
                      labelText: AppStrings.email,
                      hintText: AppStrings.email,
                      controller: emailController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.emptyEmail;
                        } else {
                          if (!value.contains('@')) {
                            return AppStrings.invalidEmail;
                          }
                        }
                        return null;
                      },
                      isPassword: false,
                      borderRadius: 16,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  MainTFF(
                      max: 1,
                      labelText: AppStrings.password,
                      hintText: AppStrings.password,
                      controller: passController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.passwordEmpty;
                        } else {
                          if (value.length < 6) {
                            return AppStrings.passwordError;
                          }
                        }
                        return null;
                      },
                      isPassword: hidePass,
                      suffix: IconButton(
                        color: ColorManager.orangeLight,
                        icon: hidePass
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                      ),
                      borderRadius: 16,
                      inputType: TextInputType.text),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.forgotPassword);
                          },
                          child: const Text(AppStrings.forgetPassword))),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFinishedState && state.data.success!) {
                        PreferenceHelper.saveDataInSharedPreference(
                            key: "token", value: state.data.token);
                        showSnackbar(AppStrings.loginsuccess, context,
                            ColorManager.green);

                    
                        PreferenceHelper.saveDataInSharedPreference(
                            key: "IsLoggedIn", value: true);
                       
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.layout);
                      } else if (state is LoginErrorState) {
                        showSnackbar(state.message, context, Colors.red);
                      } else if (state is LoginFinishedState) {
                        showSnackbar(state.data.message!, context, Colors.red);
                      }
                    },
                    builder: (context, state) {
                      return state is LoginLoadingState
                          ? const CircularProgressIndicator()
                          : MainButton(
                              text: AppStrings.login.toUpperCase(),
                              height: 50,
                              ontab: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      UserLogin(emailController.text,
                                          passController.text));
                                }
                              });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.donthaveAccount,
                          style: Theme.of(context).textTheme.labelLarge),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.register);
                        },
                        child: const Text(AppStrings.register),
                      ),
                      Container(
                        width: 20,
                        height: 10,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/arrow.png"))),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
