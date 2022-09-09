import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CounterModel extends Equatable {
  CounterModel({
    this.value = 0,
    this.id,
  });

  /// technical counter id
  String? id;

  int value;

  @override
  List<Object?> get props => [id, value];
}
