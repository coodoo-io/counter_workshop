import 'package:equatable/equatable.dart';

class CounterResponseDto extends Equatable {
  const CounterResponseDto({
    required this.sysId,
    required this.name,
    required this.counterValue,
    this.stepSize = 1,
    this.startValue = 0,
    this.color = '#ff3300',
    this.goalValue,
    this.createdAt,
    this.updatedAt,
  });

  final String sysId;
  final String name;
  final int counterValue;
  final int startValue;
  final int stepSize;
  final String color;
  final int? goalValue;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CounterResponseDto copyWith({
    String? sysId,
  }) {
    return CounterResponseDto(
      sysId: sysId ?? this.sysId,
      name: name,
      counterValue: counterValue,
      startValue: startValue,
      stepSize: stepSize,
      color: color,
      goalValue: goalValue,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [sysId, counterValue];
}
