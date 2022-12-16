import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/colors/colors.dart';
import 'package:shop_app/core/local/shared_preference.dart';
import 'package:shop_app/core/utilities/routes.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/profile/presentation/widgets/listtile.dart';
import '../bloc/profile_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.myProfile,
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: ColorManager.dark),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage(state.data.user.avtar.url),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Text(
                              
                              state.data.user.name,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              state.data.user.email,
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
                      ontab: () {},
                    ),
                    MYListTile(
                      title: AppStrings.myOrders,
                      subtitle: AppStrings.orders,
                      ontab: () {},
                    ),
                    MYListTile(
                      title: AppStrings.changePassword,
                      subtitle: AppStrings.changePasswordsub,
                      ontab: () {},
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
                );
              } else if (state is ProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileErrorState) {
                return Center(child: Text(state.message));
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
