import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';

class MYListTile extends StatelessWidget {
  final String title;

  final String? subtitle;
  final VoidCallback ontab;
  const MYListTile(
      {super.key,
      required this.title,
       this.subtitle,
      required this.ontab});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontab,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
           ,
      ),
      subtitle:  SizedBox(
            width: kWidth(context) / 4,
            child: Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorManager.grey,fontSize: 15),
            ),
          ),
      dense: true,
      trailing:
         
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
     
    );
  }
}
