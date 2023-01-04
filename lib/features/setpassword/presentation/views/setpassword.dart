import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/routes.dart';
import '../../../../core/utilities/strings.dart';
import '../../../login/presentation/widgets/alert_snackbar.dart';
import '../../../login/presentation/widgets/mainbutton.dart';
import '../../../login/presentation/widgets/maintextformfield.dart';
import '../bloc/reset_password_bloc.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePass = true;
  bool hideConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.reset,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.dark,
                      ),
                ),
                SizedBox(height: kHeight(context) * 0.05),
                Text(
                  AppStrings.enterPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: kHeight(context) * 0.05),
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
                const SizedBox(
                  height: 15,
                ),
                MainTFF(
                    max: 1,
                    labelText: AppStrings.confirmpass,
                    hintText: AppStrings.confirmpass,
                    controller: confirmPassController,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.passwordEmpty;
                      } else {
                        if (confirmPassController.text != passController.text) {
                          return AppStrings.notValidConfirmPassword;
                        }
                      }
                      return null;
                    },
                    isPassword: hideConfirmPass,
                    suffix: IconButton(
                      color: ColorManager.orangeLight,
                      icon: hideConfirmPass
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          hideConfirmPass = !hideConfirmPass;
                        });
                      },
                    ),
                    borderRadius: 16,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                  listener: (context, state) {
                    if (state is ResetPasswordFinished && state.data.success) {
                      showSnackbar(
                          state.data.message, context, ColorManager.green);
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    } else if (state is ResetPasswordError) {
                      showSnackbar(state.message, context, Colors.red);
                    } else if (state is ResetPasswordFinished) {
                      showSnackbar(state.data.message, context, Colors.red);
                    }
                  },
                  builder: (context, state) {
                    return Center(
                      child: state is ResetPasswordLoading
                          ? const CircularProgressIndicator()
                          : MainButton(
                              text: AppStrings.login.toUpperCase(),
                              height: 50,
                              ontab: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<ResetPasswordBloc>(context)
                                      .add(ConfirmPassword(passController.text,
                                          confirmPassController.text));
                                }
                              }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
