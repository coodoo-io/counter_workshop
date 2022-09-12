import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CounterModel extends Equatable {
  const CounterModel({
    this.id = '-1',
    required this.name,
    this.value = 0,
    this.stepSize = 1,
    this.startValue = 0,
    this.color = Colors.pink,
    this.goalValue,
  });

  /// technical counter id
  final String id;
  final String name;
  final int value;
  final int startValue;
  final int stepSize;
  final Color color;
  final int? goalValue;

  CounterModel copyWith({
    String? id,
    String? name,
    int? value,
    int? startValue,
    int? stepSize,
    Color? color,
    int? goalValue,
  }) {
    return CounterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      startValue: startValue ?? this.startValue,
      stepSize: stepSize ?? this.stepSize,
      color: color ?? this.color,
      goalValue: goalValue ?? this.goalValue,
    );
  }

  @override
  List<Object?> get props => [id, name, value];
}
