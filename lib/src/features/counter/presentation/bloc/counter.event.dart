import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

/// Load data from repository
class CounterFetchData extends CounterEvent {}

/// Notifies bloc to increment state
class CounterIncrementPressed extends CounterEvent {
  const CounterIncrementPressed(this.counterModel);
  final CounterModel counterModel;

  @override
  List<Object> get props => [counterModel];
}

/// Notifies bloc to decrement state
class CounterDecrementPressed extends CounterEvent {
  const CounterDecrementPressed(this.counterModel);
  final CounterModel counterModel;

  @override
  List<Object> get props => [counterModel];
}
