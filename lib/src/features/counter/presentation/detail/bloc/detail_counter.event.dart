import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';

abstract class DetailCounterEvent extends Equatable {
  const DetailCounterEvent();

  @override
  List<Object> get props => [];
}

class CounterLoading extends DetailCounterEvent {}

class CounterData extends DetailCounterEvent {
  const CounterData(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}

class CounterError extends DetailCounterEvent {}

/// Notifies bloc to increment state
class FetchCounter extends DetailCounterEvent {
  const FetchCounter(this.counterId);
  final String counterId;
  @override
  List<Object> get props => [counterId];
}

/// Notifies bloc to increment state
class CounterIncrementPressed extends DetailCounterEvent {
  const CounterIncrementPressed(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}

/// Notifies bloc to decrement state
class CounterDecrementPressed extends DetailCounterEvent {
  const CounterDecrementPressed(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}
