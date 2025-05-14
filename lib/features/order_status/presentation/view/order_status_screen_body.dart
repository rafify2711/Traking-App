// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
// import 'package:tracking_app/core/utils/enums/order_status_enum.dart';
// import 'package:tracking_app/features/order_status/presentation/viewModel/order_status_view_model.dart';
//
// import '../viewModel/OrderStatusState.dart';
//
// class OrderStatusScreenBody extends StatelessWidget {
//   const OrderStatusScreenBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<OrderStatusViewModel, OrderStatusState>(
//       listener: (context, state) {
//         if (state is OrderStatusSuccess) {
//           showSnackBar(context, "Status updated Successfully");
//         } else if (state is OrderStatusFailure) {
//           showErrorSnackBar(context, state.error);
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: BlocBuilder<OrderStatusViewModel, OrderStatusState>(
//             builder: (context, state) {
//               return Text(
//                 context.read<OrderStatusViewModel>().getAppBarTitle(state.status),
//               );
//             },
//           ),
//         ),
//         body: Center(
//           child: BlocBuilder<OrderStatusViewModel, OrderStatusState>(
//             builder: (context, state) {
//               final isDelivered = state.status == OrderStatus.delivered;
//               final isLoading = state is OrderStatusLoading;
//
//               return ElevatedButton(
//                 onPressed: isDelivered || isLoading
//                     ? null
//                     : () {
//                   context.read<OrderStatusViewModel>().updateStatus("681bd6741433a666c8da31c7");
//                 },
//                 child: isLoading
//                     ? const SizedBox(
//                   width: 20,
//                   height: 20,
//                   child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                 )
//                     : Text(context.read<OrderStatusViewModel>().getButtonText(state.status)),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
