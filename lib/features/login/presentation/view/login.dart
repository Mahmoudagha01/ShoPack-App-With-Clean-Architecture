import 'package:flutter/material.dart';
import 'package:shop_app/core/colors/colors.dart';
import 'package:shop_app/features/login/presentation/widgets/mainbutton.dart';
import 'package:shop_app/features/login/presentation/widgets/maintextformfield.dart';

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
  bool checked = false;

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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                      labelText: "Password",
                      hintText: "Password",
                      controller: passController,
                      validateText: "Password is Required!",
                      isPassword: hidePass,
                      suffix: IconButton(
                        icon:
                        hidePass ? Icon(Icons.visibility_off ): Icon(Icons.visibility),
                        onPressed: () {
                           setState(() {
                          hidePass = !hidePass;
                        });
                        },
                      ),
                      
                      borderRadius: 16,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 30,
                  ),
                  MainButton(
                      text: "LOGIN",
                      ontab: () {
                        if (formKey.currentState!.validate()) {

                        }
                      }),
                      const SizedBox(
                    height: 20,
                  ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Don't Have an account?",style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),),TextButton(onPressed: (){}, child: Text("Register"))],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
