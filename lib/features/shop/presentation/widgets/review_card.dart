import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../domain/entities/products_entity.dart';

class ReviewCard extends StatelessWidget {
  final ProductEntity product;
  final int index;
  const ReviewCard({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: kHeight(context) / 3.9,
        width: kWidth(context),
      ),
      Positioned(
        top: 25,
        left: 10,
        right: 10,
        child: SizedBox(
          width: kWidth(context),
          height: kHeight(context) / 4.5,
          child: Card(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.reviews![index].name!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBarIndicator(
                      itemSize: 20.0,
                      rating: product.ratings.toDouble(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      direction: Axis.horizontal,
                    ),
                    Text(
                      DateFormat.yMMMEd()
                          .format(product.reviews![index].createdAt!),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: ColorManager.grey),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    product.reviews![index].comment!,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          )),
        ),
      ),
      const CircleAvatar(
        backgroundImage: AssetImage('assets/images/avatar.jpg'),
      ),
    ]);
  }
}
