import 'package:farmtopia_task_app/features/order_condition/presentation/bloc/order_condition_bloc.dart';
import 'package:farmtopia_task_app/features/order_condition/presentation/widgets/virtual_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/colors/colors.dart';
import '../../../comments/presentation/pages/comments_page_sheet.dart';
import '../widgets/cond_details_card.dart';
import '../widgets/cond_gif.dart';

class OrderConditionPage extends StatelessWidget {
  static const id = 'OrderConditionPage';

  const OrderConditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderConditionBloc>(context).add(UpdateOrderCondEvent());
    return Scaffold(
      backgroundColor: COLOR_RED_MINE,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            WHITE,
            WHITE,
            WHITE,
            COLOR_RED_MINE,
            COLOR_GREEN,
            WHITE,
            WHITE,
            WHITE,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VirtualAppBar(),
            const CondGif(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: const CondDetailsCard(),
                    flex: 8,
                  ),
                  Expanded(
                    child: const SizedBox(height: 10),
                    flex: 1,
                  ),
                  _buildFab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _buildFab(context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return CommentsSheet();
            });
      },
      backgroundColor: GREEN,
      child: Icon(Icons.chat_outlined),
    );
  }
}
