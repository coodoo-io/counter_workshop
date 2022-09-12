import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CounterModel extends Equatable {
  const CounterModel({
    required this.id,
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

  @override
  List<Object?> get props => [id, name, value];
}
