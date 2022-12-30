import 'package:flutter/material.dart';


class MainTFF extends StatelessWidget {
  const MainTFF({
    Key? key,
    this.prefix,
    this.suffix,
    this.max,
    required this.controller,
required this.validate,
    required this.isPassword,
    required this.borderRadius,
    this.readOnly,
    required this.inputType,
    this.hintText,
    this.labelText,
    this.textAlign,
    this.suffixPressed,
  }) : super(key: key);

  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final bool isPassword;
  final double? borderRadius;
  final bool? readOnly;
  final int? max;
  final TextInputType inputType;
  final String? hintText;
  final String? labelText;
  final TextAlign? textAlign;
  final Function()? suffixPressed;
 final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Material(
  elevation: 1.5,
      child: TextFormField(  
        maxLines:max ,
        obscureText: isPassword,
        keyboardType: inputType,
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
          alignLabelWithHint: true,
            suffixIcon: suffix,
            prefixIcon: prefix,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            label: Text(labelText!),
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
