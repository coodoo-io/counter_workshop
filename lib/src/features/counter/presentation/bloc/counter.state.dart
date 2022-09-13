import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({required this.value});
  final int value;

  @override
  List<Object?> get props => [value];
}
