import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopack_user/features/shop/presentation/bloc/send_review_bloc.dart';
import 'package:shopack_user/features/shop/presentation/widgets/review_card.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/routes.dart';
import '../../../../core/utilities/strings.dart';
import '../../../favorite/presentation/bloc/favourite_bloc.dart';
import '../../../login/presentation/widgets/alert_snackbar.dart';
import '../../../shop/domain/entities/products_entity.dart';
import '../../widgets/carousel.dart';
import '../../widgets/product_item.dart';

class ProductDetails extends StatefulWidget {
  final ProductEntity product;
  final List<ProductEntity> products;
  final int index;
  const ProductDetails(
      {super.key,
      required this.product,
      required this.products,
      required this.index});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      upperBound: 1,
      lowerBound: 0,
    );
    super.initState();
  }

  static late AnimationController animationController;
  void animateCartAdd(BuildContext contextRenderBox, ImageProvider image) {
    var overlayEntry = OverlayEntry(
      builder: (context) {
        RenderBox? box = contextRenderBox.findRenderObject() as RenderBox?;
        if (box != null) {
          var startOffset = box
              .localToGlobal(Offset(kWidth(context) / 4, kWidth(context) / 4));
          var endOffset = Offset(kWidth(context), kHeight(context));

          CurvedAnimation curvedAnimation = CurvedAnimation(
              parent: animationController, curve: Curves.easeInCubic);

          var animatedOffset = Tween<Offset>(begin: startOffset, end: endOffset)
              .animate(curvedAnimation);
          animationController.reset();
          animationController.animateTo(1);
          return AnimatedBuilder(
            animation: animationController,
            builder: (_, child) {
              return Positioned(
                  top: animatedOffset.value.dy,
                  left: animatedOffset.value.dx,
                  child: child!);
            },
            child: SizedBox(
              width: -120 + kWidth(context) / 2,
              height: -120 + kWidth(context) / 2,
              child: Card(
                elevation: 2,
                color: Colors.grey.shade200,
                child: Image(
                  image: image,
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
    Overlay.of(contextRenderBox)?.insert(overlayEntry);
    Future.delayed(const Duration(milliseconds: 500), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> newProductsList = widget.products.reversed.toList();
    newProductsList.shuffle();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          widget.product.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
              child: BlocConsumer<FavouriteBloc, FavouriteState>(
                listener: (context, state) {
                  if (state is AddToFavouriteState) {
                    showSnackbar(AppStrings.addfav, context, Colors.green);
                  } else if (state is RemoveFromFavouriteState) {
                    showSnackbar(AppStrings.deletefav, context, Colors.green);
                  }
                },
                builder: (context, state) {
                  return CircleAvatar(
                    backgroundColor: ColorManager.white,
                    radius: 20.0,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<FavouriteBloc>(context)
                            .add(AddToFavorite(
                          product: widget.product,
                          isFavourite: widget.product.isFavourite,
                        ));
                      },
                      child: widget.product.isFavourite
                          ? const Icon(
                              Icons.favorite,
                              size: 20.0,
                              color: ColorManager.orangeLight,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              size: 20.0,
                              color: ColorManager.grey,
                            ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: kWidth(context) / 1.12,
        height: kHeight(context) / 14,
        child: FloatingActionButton.extended(
            backgroundColor: ColorManager.orangeLight,
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(AddToCart(widget.product));
              animateCartAdd(
                context,
                NetworkImage(
                  widget.product.images[0].url,
                ),
              );
            },
            label: BlocConsumer<CartBloc, CartState>(
              listener: (context, state) {
                if (state is AddToCartState) {
                  showSnackbar(AppStrings.addedToCart, context, Colors.green);
                }
              },
              builder: (context, state) {
                return Text(
                  AppStrings.addToCart.toUpperCase(),
                );
              },
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: '${widget.index}',
                  child: Carousel(images: widget.product.images)),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: kWidth(context) - 90,
                          child: Text(
                            widget.product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.product.category,
                          style: const TextStyle(
                            color: ColorManager.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              itemSize: 25.0,
                              rating: widget.product.ratings.toDouble(),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '(${widget.product.numOfReviews})',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.grey,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "${widget.product.price}\$",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: ColorManager.orangeLight),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(
                  AppStrings.description,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: ColorManager.orangeLight),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(
                  widget.product.description,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.rateandreview,
                        style: Theme.of(context).textTheme.headline6),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.productreviews,
                              arguments: widget.product);
                          BlocProvider.of<SendReviewBloc>(context)
                              .add(GetReviews(widget.product.id));
                        },
                        child: const Text(AppStrings.seeMore))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Row(
                  children: [
                    RatingBarIndicator(
                      itemSize: 25.0,
                      rating: widget.product.ratings.toDouble(),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      direction: Axis.horizontal,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      widget.product.ratings.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '(${widget.product.numOfReviews} reviews)',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              widget.product.numOfReviews != 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: ReviewCard(product: widget.product, index: 0),
                    )
                  : const SizedBox(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(AppStrings.mayLike,
                    style: Theme.of(context).textTheme.headline6),
              ),
              SizedBox(
                height: 330,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                product: widget.products[index],
                                products: widget.products,
                                index: index,
                              ),
                            ));
                      },
                      child: SizedBox(
                          width: kWidth(context) / 2,
                          height: 330,
                          child: ProductItem(product: newProductsList[index])),
                    );
                  },
                ),
              ),
              SizedBox(
                height: kHeight(context) / 11,
              )
            ],
          ),
        ),
      ),
    );
  }
}
