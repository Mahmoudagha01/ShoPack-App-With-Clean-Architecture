import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utilities/strings.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/constants.dart';
import '../../../../core/utilities/routes.dart';
import '../../../login/presentation/widgets/mainbutton.dart';
import '../../../login/presentation/widgets/maintextformfield.dart';
import '../forgotpassword_bloc/forgetpassword_bloc.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});

 final TextEditingController emailController = TextEditingController();
   final formKey = GlobalKey<FormState>();
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.forgetPasswordtext,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.dark,
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  AppStrings.enteremail,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: MainTFF(
                      labelText: AppStrings.emailHint,
                      hintText: AppStrings.emailHint,
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
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<ForgetpasswordBloc, ForgetpasswordState>(
                  listener: (context, state) {
                    if (state is ForgetpasswordFinishedState) {
                      showSnackbar(
                          state.data.message, context, ColorManager.green);
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    } else if (state is ForgetpasswordErrorState) {
                      showSnackbar(state.message, context, Colors.red);
                    }
                  },
                  builder: (context, state) {
                    return state is ForgetpasswordLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : MainButton(
                            text: AppStrings.send.toUpperCase(),
                            ontab: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ForgetpasswordBloc>(context)
                                    .add(SendLink(emailController.text));
                              }
                            });
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
