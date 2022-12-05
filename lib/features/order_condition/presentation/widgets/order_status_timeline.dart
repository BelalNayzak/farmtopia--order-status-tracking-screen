import 'package:farmtopia_task_app/features/order_condition/domain/entities/order_condition.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../core/ui/colors/colors.dart';

class OrderStatusTimeline extends StatelessWidget {
  final OrderCondition orderCond;

  const OrderStatusTimeline({
    Key? key,
    required this.orderCond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StatusTile(
          icon: Icons.receipt,
          inAppTileCondition: 0, // recieved tile
          onServerCurrentCondition: orderCond.conditionPhase,
        ),
        StatusTile(
          icon: Icons.restaurant_menu,
          inAppTileCondition: 1, // prepare tile
          onServerCurrentCondition: orderCond.conditionPhase,
        ),
        StatusTile(
          icon: Icons.local_fire_department,
          inAppTileCondition: 2, // on fire tile
          onServerCurrentCondition: orderCond.conditionPhase,
        ),
        StatusTile(
          icon: Icons.fastfood,
          inAppTileCondition: 3, // ready tile
          onServerCurrentCondition: orderCond.conditionPhase,
        ),
      ],
    );
  }
}

class StatusTile extends StatelessWidget {
  final int inAppTileCondition;
  final int onServerCurrentCondition;
  final IconData icon;

  const StatusTile({
    Key? key,
    required this.icon,
    required this.onServerCurrentCondition,
    required this.inAppTileCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.start,
      isFirst: inAppTileCondition == 0 ? true : false,
      isLast: inAppTileCondition == 3 ? true : false,
      endChild: const Text('                '),
      afterLineStyle: onServerCurrentCondition > inAppTileCondition
          ? const LineStyle(color: GREEN)
          : const LineStyle(color: GREY),
      beforeLineStyle: onServerCurrentCondition >= inAppTileCondition
          ? const LineStyle(color: GREEN)
          : const LineStyle(color: GREY),
      indicatorStyle: IndicatorStyle(
        color: onServerCurrentCondition >= inAppTileCondition ? GREEN : GREY,
        padding: const EdgeInsets.all(4),
        iconStyle: IconStyle(
          color: WHITE,
          iconData: icon,
        ),
      ),
    );
  }
}
