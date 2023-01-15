
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/utilities/mediaquery.dart';
import '../../../../core/utilities/strings.dart';
import '../../../login/presentation/widgets/mainbutton.dart';
import '../bloc/products_bloc.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ProductsBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: ColorManager.grey,
                spreadRadius: 2,
              )
            ],
          ),
          child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext _) {
                      return SizedBox(
                        height: kHeight(context) / 2.3,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StatefulBuilder(builder: (_, setState) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(AppStrings.filter,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      AppStrings.price,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: ColorManager.grey,
                                          ),
                                    ),
                                    RangeSlider(
                                      activeColor: ColorManager.orangeLight,
                                      min: 5,
                                      max: 600,
                                      values: bloc.priceSelectRange,
                                      onChanged: (value) {
                                        setState(() {
                                          BlocProvider.of<ProductsBloc>(context)
                                              .priceSelectRange = value;
                                        });
                                      },
                                      divisions: 100,
                                      labels: RangeLabels(
                                        "${bloc.priceSelectRange.start.round().toString()}\$",
                                        "${bloc.priceSelectRange.end.round().toString()}\$",
                                      ),
                                    ),
                                    Text(
                                      AppStrings.rate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: ColorManager.grey,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: bloc.rateValue.round() * 50,
                                          child: const SizedBox(),
                                        ),
                                        SizedBox(
                                          child: Text(
                                            'Products Above ${(bloc.rateValue.round())} Stars',
                                            style: const TextStyle(
                                                color: ColorManager.grey),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 100 - bloc.rateValue.round(),
                                          child: const SizedBox(),
                                        ),
                                      ],
                                    ),
                                    Slider(
                                      min: 0,
                                      max: 4,
                                      activeColor: ColorManager.orangeLight,
                                      value: bloc.rateValue,
                                      onChanged: (v) {
                                        setState(() {
                                          bloc.rateValue = v;
                                        });
                                      },
                                      divisions:4,
                                    ),
                           
                                    SizedBox(
                                      width: kWidth(context) / 2,
                                      child: BlocProvider.value(
                                        value: bloc,
                                        child: MainButton(
                                            text: AppStrings.apply,
                                            ontab: () {
                                              setState(() {
                                                bloc.add(
                                                    GetFilterSpecificProduct(
                                                        bloc.categories[
                                                            bloc.current],
                                                        bloc.priceSelectRange
                                                            .start
                                                            .round()
                                                            .toString(),
                                                        bloc.priceSelectRange
                                                            .end
                                                            .round()
                                                            .toString(),
                                                        bloc.rateValue == 0
                                                            ? '-1'
                                                            : bloc.rateValue
                                                                .round()
                                                                .toString(),
                                                        ''));
                                              });
                                              Navigator.pop(context);
                                            },
                                            height: kHeight(context)/15),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.tune))),
    );
  }
}
