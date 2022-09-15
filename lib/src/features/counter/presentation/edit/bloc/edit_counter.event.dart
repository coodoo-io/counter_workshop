import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';

abstract class EditCounterEvent extends Equatable {
  const EditCounterEvent();

  @override
  List<Object> get props => [];
}

class CounterLoading extends EditCounterEvent {}

class CounterData extends EditCounterEvent {
  const CounterData(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}

class CounterError extends EditCounterEvent {}

/// Notifies bloc to increment state
class FetchCounter extends EditCounterEvent {
  const FetchCounter(this.counterId);
  final String counterId;
  @override
  List<Object> get props => [counterId];
}

/// Notifies bloc to increment state
class CounterIncrementPressed extends EditCounterEvent {
  const CounterIncrementPressed(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}

/// Notifies bloc to decrement state
class CounterDecrementPressed extends EditCounterEvent {
  const CounterDecrementPressed(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}
