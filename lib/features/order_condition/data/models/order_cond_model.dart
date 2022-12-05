import 'package:farmtopia_task_app/features/order_condition/domain/entities/order_condition.dart';

class OrderCondModel extends OrderCondition {
  OrderCondModel({
    super.id,
    required super.condition,
    required super.conditionPhase,
    required super.condDescription,
    required super.estimatedTime,
  });

  factory OrderCondModel.fromjson(Map<String, dynamic> json) {
    return OrderCondModel(
      id: json['id'],
      conditionPhase: json['conditionPhase'],
      condition: json['condition'],
      condDescription: json['condDescription'],
      estimatedTime: json['estimatedTime'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'condition': condition,
      'conditionPhase': conditionPhase,
      'condDescription': condDescription,
      'estimatedTime': estimatedTime,
    };
  }
}
