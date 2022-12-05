import 'package:farmtopia_task_app/features/order_condition/domain/entities/order_condition.dart';
import 'package:farmtopia_task_app/features/order_condition/presentation/bloc/order_condition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CondGif extends StatelessWidget {
  const CondGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderConditionBloc, OrderConditionState>(
      builder: (context, state) {
        if (state is OrderConditionUpdatedState) {
          return OrderConditionGif(orderCondition: state.orderCondition);
        } else if (state is ServerErrorState) {
          return Image.asset(
            'assets/images/util_no_internet.gif',
            fit: BoxFit.cover,
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class OrderConditionGif extends StatelessWidget {
  final OrderCondition orderCondition;

  const OrderConditionGif({
    required this.orderCondition,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: _mapOrderConditionToGif(orderCondition),
          ),
          Opacity(
            opacity: 0.5,
            child: RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Image.asset('assets/images/util_bkg2.gif'),
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Image.asset('assets/images/util_bkg2.gif'),
          ),
        ],
      ),
    );
  }

  Image _mapOrderConditionToGif(OrderCondition o) {
    switch (o.conditionPhase) {
      case 0: // recieved
        return Image.asset(
          'assets/images/order_recieved.gif',
          fit: BoxFit.cover,
        );
      case 1: // preparing
        return Image.asset(
          'assets/images/order_preparing.gif',
          fit: BoxFit.cover,
        );
      case 2: // on_fire
        return Image.asset(
          'assets/images/order_on_fire.gif',
          fit: BoxFit.cover,
        );
      case 3: // ready
        return Image.asset(
          'assets/images/order_is_ready.gif',
          fit: BoxFit.cover,
        );
      default:
        return Image.asset(
          'assets/images/order_recieved.gif',
          fit: BoxFit.cover,
        );
    }
  }
}
