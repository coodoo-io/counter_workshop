import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CounterModel extends Equatable {
  CounterModel({
    this.value = 0,
    this.id = '1',
  });

  /// technical counter id
  final String id;

  int value;

  @override
  List<Object?> get props => [id, value];
}
