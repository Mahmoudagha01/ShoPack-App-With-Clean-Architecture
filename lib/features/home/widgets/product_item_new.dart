import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';
import '../../../core/colors/colors.dart';
import '../../../core/utilities/mediaquery.dart';

class NewProductItem extends StatelessWidget {
  const NewProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Image.network(
              product.images[0].url,
              width: 200,
              height: 200,
            ),
            Positioned(
              top: 10,
              left: 8,
              child: Container(
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.dark,
                ),
                child: Center(
                  child: Text(
                    AppStrings.newText.toUpperCase(),
                    style: const TextStyle(color: ColorManager.white),
                  ),
                ),
              ),
            ),
            Positioned(
              left: kWidth(context) * 0.3,
              bottom: kHeight(context) * 0.13,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: ColorManager.grey,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: ColorManager.white,
                  radius: 20.0,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_outline,
                      size: 20.0,
                      color: ColorManager.grey,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemSize: 25.0,
                          rating: product.ratings.toDouble(),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '(${product.numOfReviews})',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      product.category,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: ColorManager.grey,
                          ),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 6.0),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${product.price} \$',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: ColorManager.dark),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
