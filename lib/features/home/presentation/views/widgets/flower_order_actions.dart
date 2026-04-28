import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utils/app_text_styles.dart';
import 'package:tracking_app/core/utils/services/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/helper_func/snack_bar.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';
import 'package:tracking_app/features/home/data/models/order_model.dart';
import 'package:tracking_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class FlowerOrderActions extends StatelessWidget {
  final OrderModel order;
  final bool isAccepting;

  const FlowerOrderActions({
    super.key,
    required this.order,
    required this.isAccepting,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "EGP${order.totalPrice!}",
            style: AppTextStyles.instance.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: responsiveWidth(111),
            child: OutlinedButton(
              onPressed: () {
                context.read<HomeCubit>().rejectOrder(orderId: order.id!);
                showSnackBar(context, "order rejected");
              },
              child: Text(LocaleKeys.reject.tr()),
            ),
          ),
          SizedBox(
            width: responsiveWidth(111),
            child: ElevatedButton(
              onPressed: isAccepting
                  ? null
                  : () {
                      context.read<HomeCubit>().acceptOrder(
                            request: AcceptOrderRequestEntity(
                              orderId: order.id!,
                              orderData: order,
                            ),
                          );
                      showSnackBar(context, "order accepted");
                    },
              child: isAccepting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(LocaleKeys.accept.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
