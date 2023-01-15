import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shopack_user/features/payment/presentation/bloc/order_bloc.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/local/shared_preference.dart';
import '../../../../core/theme/bloc/theme_bloc.dart';
import '../../../../core/theme/theme_data.dart';
import '../../../../core/theme/theme_service.dart';
import '../../../../core/utilities/enums.dart';
import '../../../../core/utilities/routes.dart';
import '../../../../core/utilities/strings.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/listtile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              late AppTheme currentTheme;
              return IconButton(
                onPressed: () {
                  if (state.themeData == appThemeData[AppTheme.lightTheme]) {
                    currentTheme = AppTheme.values[1];
                    ThemeDatabaseService.putThemeSettings(1);
                  } else {
                    currentTheme = AppTheme.values[0];
                    ThemeDatabaseService.putThemeSettings(0);
                  }

                  context
                      .read<ThemeBloc>()
                      .add(ThemeChanged(theme: currentTheme));
                },
                icon: state.themeData == appThemeData[AppTheme.lightTheme]
                    ? const Icon(Icons.sunny)
                    : const Icon(Icons.mode_night),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppStrings.myProfile,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      state.data.user!.avtar != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(state.data.user!.avtar!.url),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png'),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Text(
                                state.data.user!.name,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                state.data.user!.email,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: ColorManager.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      MYListTile(
                        title: AppStrings.editPersonalInfo,
                        subtitle: AppStrings.edit,
                        ontab: () {
                          Navigator.pushNamed(context, AppRoutes.updateProfile,
                              arguments: state.data.user);
                        },
                      ),
                      MYListTile(
                        title: AppStrings.myOrders,
                        subtitle: AppStrings.orders,
                        ontab: () {
                          BlocProvider.of<OrderBloc>(context).add(GetAllOrders());
                          Navigator.pushNamed(context, AppRoutes.orders);
                        },
                      ),
                      MYListTile(
                        title: AppStrings.changePassword,
                        subtitle: AppStrings.changePasswordsub,
                        ontab: () {
                          Navigator.pushNamed(context, AppRoutes.updatePassword);
                        },
                      ),
                      ListTile(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.login);
                            PreferenceHelper.removeData(key: 'token');
                          },
                          title: Text(
                            AppStrings.logout,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.red),
                          ),
                          dense: true,
                          trailing: const Icon(
                            Icons.logout,
                            size: 15,
                            color: Colors.red,
                          ))
                    ],
                  ),
                );
              } else if (state is ProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileErrorState) {
                return state.message == AppStrings.noInternetError
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: LottieBuilder.asset(
                                    'assets/images/nointernet.json')),
                          ),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(state.message),
                          ))
                        ],
                      )
                    : Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
