import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/core/colors/colors.dart';
import 'package:shop_app/features/shop/domain/entities/products_entity.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app/features/shop/presentation/bloc/products_bloc.dart';

import 'package:shop_app/features/shop/presentation/widgets/reviewsheet.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
             BlocProvider.of<ProductsBloc>(context).add(
              const GetSpecificProduct("Clothes", '0', '100000', '-1', ''));
          });
         
        },
        child: Padding(
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.product.reviews![index].name!),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RatingBarIndicator(
                                                  itemSize: 20.0,
                                                  rating: widget.product.ratings
                                                      .toDouble(),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  direction: Axis.horizontal,
                                                ),
                                                Text(
                                                  DateFormat.yMMMEd().format(
                                                      widget.product.reviews![index]
                                                          .createdAt!),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color: ColorManager
                                                              .grey),
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
                                                widget.product
                                                    .reviews![index].comment!,
                                                textAlign: TextAlign.justify,
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                    ),
                                  ),
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.jpg'),
                                  ),
                                ]);
                              },
                            )))
            ],
          ),
        ),
      ),
    );
  }
}
