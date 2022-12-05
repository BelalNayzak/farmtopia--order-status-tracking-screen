import 'dart:convert' as convert;

import 'package:farmtopia_task_app/features/order_condition/presentation/pages/order_cond_page.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../core/strings/strings.dart';
import '../../data/models/order_cond_model.dart';
import '../bloc/order_condition_bloc.dart';

class DummyPage extends StatelessWidget {
  static const id = 'DummyPage';

  const DummyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _subscribeToNotifyOrderIsUpdated(context);
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async => await _sendOrderToTrack(context),
        child: const Text('Track Order'),
      ),
    );
  }

  Future<void> _sendOrderToTrack(context) async {
    final url = Uri.parse('$BASE_URL/order_status/-NITmo5ds4SCjRNk7UgJ.json');
    final response = await http.put(
      url,
      body: convert.json.encode(OrderCondModel(
        id: 0,
        condition: 'Order Recieved',
        conditionPhase: 0,
        condDescription:
            'We\'ve recieved your order. Please relax till we get it ready',
        estimatedTime: 10,
      ).tojson()),
    );

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, OrderConditionPage.id);
    }
  }

  void _subscribeToNotifyOrderIsUpdated(context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    var subscription = ref
        .child('order_status')
        .child('-NITmo5ds4SCjRNk7UgJ')
        .child('conditionPhase')
        .onValue;
    subscription.listen((DatabaseEvent event) {
      print('Hiiiiiiiii ${event.snapshot.value}');
      BlocProvider.of<OrderConditionBloc>(context).add(UpdateOrderCondEvent());
    });
  }
}
