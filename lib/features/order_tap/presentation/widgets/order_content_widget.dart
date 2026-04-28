import 'package:flutter/material.dart';
import '../models/order_data_model.dart';
import 'order_stats_row.dart';
import 'order_header_widget.dart';
import 'order_item_card.dart';

class OrderContentWidget extends StatelessWidget {
  final List<dynamic> orders;
  final String canceledCount;
  final String completedCount;

  const OrderContentWidget({
    super.key,
    required this.orders,
    required this.canceledCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderStatsRow(
            canceledCount: canceledCount,
            completedCount: completedCount,
          ),
          const OrderHeaderWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final orderData = OrderDataModel.fromOrderData(orders[index]);
                return OrderItemCard(
                  orderState: orderData.state,
                  storeName: orderData.storeName,
                  storeAddress: orderData.storeAddress,
                  storeImage: orderData.storeImage,
                  userFirstName: orderData.userFirstName,
                  userLastName: orderData.userLastName,
                  userPhoto: orderData.userPhoto,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
