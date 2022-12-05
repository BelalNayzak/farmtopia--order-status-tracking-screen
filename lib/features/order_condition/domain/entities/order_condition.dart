class OrderCondition {
  final int? id;
  final int conditionPhase;
  final String condition;
  final String condDescription;
  final int estimatedTime;

  OrderCondition({
    this.id,
    required this.condition,
    required this.conditionPhase,
    required this.condDescription,
    required this.estimatedTime,
  });
}
