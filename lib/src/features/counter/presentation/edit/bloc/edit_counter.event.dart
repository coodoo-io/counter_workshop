import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';

abstract class EditCounterEvent extends Equatable {
  const EditCounterEvent();

  @override
  List<Object> get props => [];
}

class CounterLoading extends EditCounterEvent {}

class CounterError extends EditCounterEvent {}

class CounterCreate extends EditCounterEvent {
  const CounterCreate(this.counterModel);
  final CounterModel counterModel;
  @override
  List<Object> get props => [counterModel];
}

class FetchCounter extends EditCounterEvent {
  const FetchCounter(this.counterId);
  final String counterId;
  @override
  List<Object> get props => [counterId];
}
