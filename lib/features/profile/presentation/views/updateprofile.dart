import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/profile/presentation/bloc/profile_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../../../login/presentation/widgets/alert_snackbar.dart';
import '../../../login/presentation/widgets/mainbutton.dart';
import '../../../login/presentation/widgets/maintextformfield.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return  state is ProfileLoadedState? SingleChildScrollView(
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
                            AppStrings.personalinfo,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.dark),
                          ),
                        ],
                      ),
                             SizedBox(height: kHeight(context) * 0.1),

                      SizedBox(height: kHeight(context) * 0.1),
                      MainTFF(
                        labelText: AppStrings.name,
                        hintText: state.data.user.name,
                        controller: nameController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.nameEmpty;
                          }

                          return null;
                        },
                        borderRadius: 16,
                        inputType: TextInputType.text,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MainTFF(
                          labelText: AppStrings.email,
                          hintText: state.data.user.email,
                        
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
                      BlocConsumer<ProfileBloc, ProfileState>(
                        listener: (context, state) {
                          if (state is ProfileUpdateState && state.data.success) {
                            showSnackbar(AppStrings.updateproflesuccess, context,
                                ColorManager.green);
                          } else if (state is ProfileErrorState) {
                            showSnackbar(state.message, context, Colors.red);
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
                                      BlocProvider.of<ProfileBloc>(context).add(
                                          UpdataProfileEvent(name, email, avatar));
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
                                    image:
                                        AssetImage("assets/images/arrow.png"))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ):SizedBox();
          },
        ),
      ),
    );
  }
}
