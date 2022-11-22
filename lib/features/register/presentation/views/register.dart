import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/colors/colors.dart';
import 'package:shop_app/core/utilities/routes.dart';
import 'package:shop_app/features/login/presentation/widgets/mainbutton.dart';
import 'package:shop_app/features/login/presentation/widgets/maintextformfield.dart';
import '../../../../core/utilities/constants.dart';
import '../bloc/register_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePass = true;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.dark),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  MainTFF(
                      labelText: "Name",
                      hintText: "Nmae",
                      controller: nameController,
                      validateText: "Name is Required!",
                      isPassword: false,
                      borderRadius: 16,
                      inputType: TextInputType.text),
                  const SizedBox(
                    height: 10,
                  ),
                  MainTFF(
                      labelText: "Email",
                      hintText: "Email",
                      controller: emailController,
                      validateText: "Email is Required!",
                      isPassword: false,
                      borderRadius: 16,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 10,
                  ),
                  MainTFF(
                      labelText: "Phone",
                      hintText: "Phone",
                      controller: phoneController,
                      validateText: "Phone is Required!",
                      isPassword: false,
                      borderRadius: 16,
                      inputType: TextInputType.number),
                  const SizedBox(
                    height: 10,
                  ),
                  MainTFF(
                      labelText: "Password",
                      hintText: "Password",
                      controller: passController,
                      validateText: "Password is Required!",
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
                    height: 30,
                  ),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterFinishedState && state.data.status) {
                        showSnackbar(
                            state.data.message, context, ColorManager.green);
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      } else if (state is RegisterFinishedState) {
                        showSnackbar(state.data.message, context, Colors.red);
                      } else if (state is RegisterErrorState) {
                        showSnackbar(state.message, context, Colors.red);
                      }
                    },
                    builder: (context, state) {
                      return state is RegisterLoadingState
                          ? const CircularProgressIndicator()
                          : MainButton(
                              text: "SIGN UP",
                              ontab: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                    UserRegister(
                                      email: emailController.text,
                                      name: nameController.text,
                                      password: passController.text,
                                      phone: phoneController.text,
                                    ),
                                  );
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
                      Text(
                        "Already have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                          
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Login"),),
                      Container(width:20,height: 10 ,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/arrow.png"))),)
                    ],
                  ),
                   const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
