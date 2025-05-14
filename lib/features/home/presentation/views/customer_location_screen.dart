import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/core/utils/colors.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/features/home/presentation/view%20model/user_location_cubit/current_user_location_cubit.dart';
import 'package:tracking_app/features/home/presentation/views/widgets/customer_location_screen_body.dart';


class CustomerLocationScreen extends StatelessWidget {
  const CustomerLocationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentUserLocationCubit()..getCurrentLocation(),
      child: Scaffold(
        body: BlocConsumer<CurrentUserLocationCubit, CurrentUserLocationState>(
          listener: (context, state) {
            if (state.locationState is BaseError<String>) {
              showErrorSnackBar(
                context,
                (state.locationState as BaseError<String>).errorMessage ?? "",
              );
            }
          },
          builder: (context, state) {
            if (state.locationState is BaseSuccess) {
              return CustomerLocationScreenBody(
                driverLat: state.lattitude ?? 0.0,
                driverLong: state.longitude ?? 0.0,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: PalletsColors.mainColorBase,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
