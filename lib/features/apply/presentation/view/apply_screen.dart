import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/di.dart';
import 'package:tracking_app/features/apply/domain/use_case/apply_use_case.dart';
import 'package:tracking_app/features/apply/domain/use_case/get_vehicle_use_case.dart';
import 'package:tracking_app/features/apply/presentation/view/widgets/apply_screen_body.dart';
import 'package:tracking_app/features/apply/presentation/view_model/cubit/apply_cubit.dart';


class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplyCubit(getIt.get<ApplyUseCase>() , getIt.get<GetVehiclesUseCase>() ),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Apply"),
        ),
        body: const ApplyScreenBody(),
      ),
    );
  }
}

// class CustomeAppBar extends StatelessWidget {
//   const CustomeAppBar({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           padding: const EdgeInsets.all(0),
//           onPressed: () {},
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         Text('Apply'),
//       ],
//     );
//   }
// }
