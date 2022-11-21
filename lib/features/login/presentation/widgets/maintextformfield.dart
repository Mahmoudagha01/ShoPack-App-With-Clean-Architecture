// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MainTFF extends StatelessWidget {
  const MainTFF({
    Key? key,
    this.prefix,
    this.suffix,
    required this.controller,
    required this.validateText,
    required this.isPassword,
    required this.borderRadius,
    this.readOnly,
    required this.inputType,
    this.hintText,
    this.labelText,
    this.textAlign,
    this.suffixPressed,
  }) : super(key: key);
  final IconData? prefix;
  final Widget? suffix;

  final TextEditingController controller;

  final String validateText;

  final bool isPassword;

  final double? borderRadius;

  final bool? readOnly;

  final TextInputType inputType;

  final String? hintText;
  final String? labelText;
  final TextAlign? textAlign;

  final Function()? suffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: isPassword,
      keyboardType: inputType,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return validateText;
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: suffix,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          label: Text(labelText!),
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
