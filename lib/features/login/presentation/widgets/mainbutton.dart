import 'package:flutter/material.dart';
import 'package:shop_app/core/colors/colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback ontab;
  const MainButton({Key? key, required this.text, required this.ontab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: ontab,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: ColorManager.white),
        ),
      ),
    );
  }
}
