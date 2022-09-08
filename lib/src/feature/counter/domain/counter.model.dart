import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Counter extends Equatable {
  Counter({
    this.value = 0,
  });

  int value;

  @override
  List<Object?> get props => [value];
}
