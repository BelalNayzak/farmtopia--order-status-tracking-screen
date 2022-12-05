import 'package:farmtopia_task_app/features/order_condition/domain/entities/order_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/colors/colors.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../bloc/order_condition_bloc.dart';
import 'order_status_timeline.dart';

class CondDetailsCard extends StatelessWidget {
  const CondDetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderConditionBloc, OrderConditionState>(
      builder: (context, state) {
        if (state is OrderConditionUpdatedState) {
          return _buildCardDetails(orderCond: state.orderCondition);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Card _buildCardDetails({required OrderCondition orderCond}) {
    return Card(
      elevation: 20,
      color: WHITE,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 50,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: OrderStatusTimeline(orderCond: orderCond),
            ),
            const Divider(height: 5, color: GREEN),
            const SizedBox(height: 20),
            Text(
              orderCond.condition,
              textAlign: TextAlign.center,
              style: TXT_STYLE_ORDER_STATUS,
            ),
            const SizedBox(height: 10),
            Text(
              'est: ${orderCond.estimatedTime.toString()} minutes',
              textAlign: TextAlign.center,
              style: TXT_STYLE_ORDER_STATUS_EST,
            ),
            const SizedBox(height: 20),
            Text(
              orderCond.condDescription,
              textAlign: TextAlign.center,
              style: TXT_STYLE_ORDER_STATUS_DESC,
            ),
          ],
        ),
      ),
    );
  }
}
