import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';

abstract class EditCounterEvent extends Equatable {
  const EditCounterEvent();

  @override
  List<Object> get props => [];
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
