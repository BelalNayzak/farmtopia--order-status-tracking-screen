import 'dart:convert' as convert;

import 'package:farmtopia_task_app/core/errors/exceptions.dart';
import 'package:farmtopia_task_app/core/strings/strings.dart';
import 'package:farmtopia_task_app/features/order_condition/data/models/order_cond_model.dart';
import 'package:farmtopia_task_app/features/order_condition/domain/entities/order_condition.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<OrderCondition> getOrderCondition();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<OrderCondition> getOrderCondition() async {
    final url = Uri.parse('$BASE_URL/order_status.json');
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> singleOrderWithItsId =
          convert.json.decode(response.body);

      final Map<String, dynamic> orderAsMap =
          singleOrderWithItsId.values.toList()[0]; // our order
      OrderCondition o = OrderCondModel.fromjson(orderAsMap);

      return Future.value(o);
    } else {
      throw ServerException();
    }
  }
}
