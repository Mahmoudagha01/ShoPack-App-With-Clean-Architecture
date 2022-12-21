import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/features/shop/presentation/widgets/review_card.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../domain/entities/products_entity.dart';
import '../widgets/reviewsheet.dart';

class ReviewsView extends StatefulWidget {
  final ProductEntity product;
  const ReviewsView({super.key, required this.product});

  @override
  State<ReviewsView> createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(AppStrings.rateandreview,
            style: Theme.of(context).textTheme.headline6),
      ),
      floatingActionButton: SizedBox(
        width: kWidth(context) / 2.6,
        height: kHeight(context) / 14,
        child: FloatingActionButton.extended(
            backgroundColor: ColorManager.orangeLight,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                  ),
                  context: context,
                  builder: (BuildContext _) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ReviewSheet(
                        id: widget.product.id,
                      ),
                    );
                  });
            },
            label: Row(
              children: [
                const Icon(Icons.edit),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: kWidth(context) / 3.7,
                  child: const FittedBox(
                    child: Text(
                      AppStrings.writereview,
                    ),
                  ),
                ),
              ],
            )),
      ),
      body: Stack(children: [
        ListView(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(widget.product.ratings.toString(),
                          style: Theme.of(context).textTheme.headline6),
                      Text('${widget.product.numOfReviews.toString()} ratings',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: ColorManager.grey)),
                    ],
                  ),
                  RatingBarIndicator(
                    itemSize: 50.0,
                    rating: widget.product.ratings.toDouble(),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    direction: Axis.horizontal,
                  ),
                ],
              ),
              Expanded(
                  child: Center(
                      child: widget.product.reviews!.isEmpty
                          ? Lottie.asset('assets/images/empty.json')
                          : ListView.builder(
                              itemCount: widget.product.reviews!.length,
                              itemBuilder: (context, index) {
                                return ReviewCard(
                                  product: widget.product,
                                  index: index,
                                );
                              },
                            )))
            ],
          ),
        ),
      ]),
    );
  }
}
