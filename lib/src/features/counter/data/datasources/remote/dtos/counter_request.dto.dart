class CounterRequestDto {
  CounterRequestDto({
    this.sysId,
    required this.name,
    required this.counterValue,
    this.stepSize = 1,
    this.startValue = 0,
    this.color = '#ff3300',
    this.goalValue,
    this.createdAt,
    this.updatedAt,
  });

  late final String? sysId;
  final String name;
  final int counterValue;
  final int startValue;
  final int stepSize;
  final String color;
  final int? goalValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
