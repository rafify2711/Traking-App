import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/config/routes_name.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/features/edit_vehicle/edit_vehicle_screen.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile_cubit/profile_cubit.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(LocaleKeys.profile.tr()),
      ),
      body: Column(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final status = state.orderState;

              if (status is BaseError) {
                return Center(
                  child: Text(status.errorMessage ?? 'Unknown error'),
                );
              } else if (status is BaseLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: PalletsColors.mainColorBase,
                    ),
                  ),
                );
              } else {
                var driverData = state.driverData;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.changePasswordScreen,
                        );
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.editProfileView,
                            arguments: driverData,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 4,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                driverData?.driver?.photo ?? "",
                              ),
                              radius: 25,
                            ),
                        
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "${driverData?.driver?.firstName} ${driverData?.driver?.lastName}",
                        
                                  style: AppTextStyles.instance.textStyle18
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  driverData?.driver?.email ?? "",
                                  style: AppTextStyles.instance.textStyle14
                                      .copyWith(color: PalletsColors.blackBase),
                                ),
                                Text(
                                  driverData?.driver?.phone ?? "",
                                  style: AppTextStyles.instance.textStyle14
                                      .copyWith(color: PalletsColors.blackBase),
                                ),
                              ],
                            ),
                        
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                        
                              color: PalletsColors.gray,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EditVehicleScreen(
                                getVehicleResponse: state.getVehicle!,
                                getLoggedDriverDataResponse: state.driverData!,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                LocaleKeys.vehicleInfo.tr(),

                                style: AppTextStyles.instance.textStyle18
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                state.getVehicle?.vehicle?.type ??
                                    driverData?.driver?.vehicleType ??"",
                                style: AppTextStyles.instance.textStyle14
                                    .copyWith(color: PalletsColors.blackBase),
                              ),
                              Text(
                                driverData?.driver?.vehicleNumber ?? "",
                                style: AppTextStyles.instance.textStyle14
                                    .copyWith(color: PalletsColors.blackBase),
                              ),
                            ],
                          ),

                          trailing: const Icon(
                            Icons.arrow_forward_ios,

                            color: PalletsColors.gray,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.translate),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              LocaleKeys.language,
                              style: AppTextStyles.instance.textStyle16
                                  .copyWith(
                                    color: PalletsColors.blackBase,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              LocaleKeys.english,
                              style: AppTextStyles.instance.textStyle13
                                  .copyWith(color: PalletsColors.mainColorBase),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.logout),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              LocaleKeys.logOut,
                              style: AppTextStyles.instance.textStyle16
                                  .copyWith(
                                    color: PalletsColors.blackBase,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(Icons.logout),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
