import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shopack_user/core/colors/colors.dart';
import 'package:shopack_user/core/utilities/mediaquery.dart';
import 'package:shopack_user/core/utilities/strings.dart';
import 'package:shopack_user/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopack_user/features/cart/presentation/bloc/location_bloc.dart';
import 'package:shopack_user/features/cart/presentation/widgets/deliverymethod_card.dart';
import 'package:shopack_user/features/cart/presentation/widgets/mappreview.dart';
import 'package:shopack_user/features/login/presentation/widgets/alert_snackbar.dart';
import 'package:shopack_user/features/login/presentation/widgets/maintextformfield.dart';
import 'package:shopack_user/features/payment/presentation/bloc/order_bloc.dart';
import 'package:shopack_user/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utilities/routes.dart';
import '../../../payment/presentation/bloc/payment_bloc.dart';

class AddNewAddressView extends StatefulWidget {
  const AddNewAddressView({super.key});

  @override
  State<AddNewAddressView> createState() => _AddNewAddressViewState();
}

class _AddNewAddressViewState extends State<AddNewAddressView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var countryPicker = const FlCountryCodePicker();

  CountryCode? countryFlag =
      const CountryCode(name: 'Egypt', code: 'EG', dialCode: '+20');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.checkout,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      floatingActionButton: SizedBox(
        width: kWidth(context) / 1.12,
        height: kHeight(context) / 14,
        child: BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state is CreateOrderLoaded) {
              showSnackbar(state.data.message, context, ColorManager.green);
            }
          },
          child: BlocConsumer<PaymentBloc, PaymentState>(
            listener: (context, state) {
              if (state is PaymentRequestFinished) {
                Navigator.pushNamed(context, AppRoutes.payment);
              }
            },
            builder: (context, state) {
              return state is Paymentloading || state is CreateOrderLoading
                  ? const Center(child: CircularProgressIndicator())
                  : FloatingActionButton.extended(
                      backgroundColor: ColorManager.orangeLight,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<PaymentBloc>(context).add(
                            RequestPayment(
                                BlocProvider.of<PaymentBloc>(context)
                                    .PAYMOB_FIRST_TOKEN,
                                (BlocProvider.of<CartBloc>(context)
                                                .totalAmount *
                                            100 +
                                        BlocProvider.of<LocationBloc>(context)
                                                .delivery *
                                            100)
                                    .toString(),
                                BlocProvider.of<PaymentBloc>(context).ORDER_ID,
                                firstNameController.text,
                                lastNameController.text,
                                phoneController.text,
                                emailController.text,
                                BlocProvider.of<LocationBloc>(context)
                                    .currentAddress![0]
                                    .street!,
                                BlocProvider.of<LocationBloc>(context)
                                    .currentAddress![0]
                                    .locality!,
                                BlocProvider.of<LocationBloc>(context)
                                    .currentAddress![0]
                                    .country!,
                                BlocProvider.of<LocationBloc>(context)
                                    .currentAddress![0]
                                    .subAdministrativeArea!,
                                dotenv.env['INTEGRATION_ID_CARD']!),
                          );
                          BlocProvider.of<OrderBloc>(context).add(
                            CreateNewOrder(
                              BlocProvider.of<CartBloc>(context)
                                  .totalAmount
                                  .toInt(),
                              BlocProvider.of<LocationBloc>(context).delivery,
                              BlocProvider.of<CartBloc>(context)
                                      .totalAmount
                                      .toInt() +
                                  BlocProvider.of<LocationBloc>(context)
                                      .delivery,
                              
                              phoneController.text,
                              BlocProvider.of<LocationBloc>(context)
                                  .currentAddress![0]
                                  .postalCode!,
                              BlocProvider.of<LocationBloc>(context)
                                  .currentAddress![0]
                                  .street!,
                              BlocProvider.of<LocationBloc>(context)
                                  .currentAddress![0]
                                  .locality!,
                              BlocProvider.of<LocationBloc>(context)
                                  .currentAddress![0]
                                  .country!,
                              "succeeded",
                              const Uuid().v4(),
                              BlocProvider.of<LocationBloc>(context)
                                  .currentAddress![0]
                                  .administrativeArea!,
                              BlocProvider.of<CartBloc>(context).orderItems    
                            ),
                          );
                        }
                      },
                      label: Text(
                        AppStrings.submitOrder.toUpperCase(),
                      ));
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.currentLocation,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.mapview);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(AppStrings.addNew),
                ),
              ],
            ),
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<LocationBloc>(context);
                if (state is MapLoadingState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: kHeight(context) / 8,
                      ),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                } else if (state is MapLoadedState ||
                    state is MapSelectedPosition ||
                    state is SelectMethodState) {
                  addressController.text =
                      BlocProvider.of<LocationBloc>(context)
                          .currentAddressDetails!;
                  firstNameController.text =
                      BlocProvider.of<ProfileBloc>(context)
                          .userName
                          .split(' ')
                          .first;
                  lastNameController.text =
                      BlocProvider.of<ProfileBloc>(context)
                          .userName
                          .split(' ')
                          .last;
                  emailController.text =
                      BlocProvider.of<ProfileBloc>(context).userEmail;

                  return Form(
                    key: formKey,
                    child: Column(
                      children: [
                        MapPreview(bloc: bloc),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.deliveryAddress,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                        MainTFF(
                            max: 1,
                            labelText: AppStrings.addressLine,
                            controller: addressController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.emptyaddress;
                              }
                              return null;
                            },
                            isPassword: false,
                            borderRadius: 15,
                            inputType: TextInputType.text),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTFF(
                            max: 1,
                            labelText: AppStrings.firstname,
                            controller: firstNameController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.nameEmpty;
                              }
                              return null;
                            },
                            isPassword: false,
                            borderRadius: 15,
                            inputType: TextInputType.text),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTFF(
                            max: 1,
                            labelText: AppStrings.lastname,
                            controller: lastNameController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.nameEmpty;
                              }
                              return null;
                            },
                            isPassword: false,
                            borderRadius: 15,
                            inputType: TextInputType.text),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTFF(
                            max: 1,
                            labelText: AppStrings.email,
                            controller: emailController,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return AppStrings.emptyEmail;
                              }
                              return null;
                            },
                            isPassword: false,
                            borderRadius: 15,
                            inputType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 20,
                        ),
                        MainTFF(
                          validate: (value) {
                            if (value!.isEmpty) {
                              return AppStrings.phoneRequired;
                            } else if (value.length < 10) {
                              return AppStrings.phonemust;
                            }
                            return null;
                          },
                          controller: phoneController,
                          inputType: TextInputType.number,
                          labelText: AppStrings.phone,
                          max: 1,
                          isPassword: false,
                          hintText: AppStrings.enterphone,
                          prefix: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              InkWell(
                                onTap: () async {
                                  var temp = countryFlag;
                                  var flag = await countryPicker.showPicker(
                                      context: context);
                                  flag ??= temp;
                                  setState(() {
                                    countryFlag = flag;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      child: countryFlag != null
                                          ? countryFlag!.flagImage
                                          : const SizedBox(),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          borderRadius: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.deliveryMethod,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: kHeight(context) / 6.5,
                          child: ListView.builder(
                            clipBehavior: Clip.antiAlias,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) => DeliveryMethodCard(
                              index: index,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.order,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: ColorManager.grey),
                              ),
                              Text(
                                  '${BlocProvider.of<CartBloc>(context).totalAmount} \$',
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.delivery,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: ColorManager.grey),
                              ),
                              Text(
                                  '${BlocProvider.of<LocationBloc>(context).delivery} \$',
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppStrings.summery,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: ColorManager.grey),
                              ),
                              Text(
                                  '${BlocProvider.of<CartBloc>(context).totalAmount + BlocProvider.of<LocationBloc>(context).delivery} \$',
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kHeight(context) / 12,
                        )
                      ],
                    ),
                  );
                } else if (state is MapErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
