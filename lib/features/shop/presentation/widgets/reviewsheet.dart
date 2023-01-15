import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../../login/presentation/widgets/alert_snackbar.dart';
import '../../../login/presentation/widgets/mainbutton.dart';
import '../../../login/presentation/widgets/maintextformfield.dart';
import '../bloc/send_review_bloc.dart';

class ReviewSheet extends StatefulWidget {
  final String id;
  const ReviewSheet({super.key, required this.id});

  @override
  State<ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<ReviewSheet> {
  final TextEditingController reviewController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late num ratings;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeight(context) / 1.9,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.whatrate,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                RatingBar(
                  ratingWidget: RatingWidget(
                    full: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    half: const Icon(
                      Icons.star,
                    ),
                    empty: const Icon(
                      Icons.star_border,
                      color: ColorManager.grey,
                    ),
                  ),
                  onRatingUpdate: (ratevalue) {
                    setState(() {
                      ratings = ratevalue;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppStrings.plsshareopinion,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                MainTFF(
                    max: 6,
                    controller: reviewController,
                    validate: (v) {
                      return null;
                    },
                    labelText: AppStrings.yourReview,
                    isPassword: false,
                    borderRadius: 15,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                BlocConsumer<SendReviewBloc, SendReviewState>(
                  listener: (context, state) {
                    if (state is SendReviewLoadedState && state.data.success) {
                      showSnackbar(AppStrings.sendreviewsuccess, context,
                          ColorManager.green);
                    } else if (state is SendReviewLoadedState) {
                      showSnackbar(state.data.message!, context, Colors.red);
                    } else if (state is SendReviewErrorState) {
                      showSnackbar(state.message, context, Colors.red);
                    }
                  },
                  builder: (context, state) {
                    return state is SendReviewLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : MainButton(
                            text: AppStrings.sendReview,
                            ontab: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<SendReviewBloc>(context).add(
                                    SendReview(widget.id, reviewController.text,
                                        ratings));
                                Navigator.pop(context);
                              }
                            },
                            height: 40);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
