import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class EditCounterState extends Equatable {
  const EditCounterState();

  @override
  List<Object?> get props => [];
}

/// The initial Counter State
class EditCounterInitial extends EditCounterState {
  const EditCounterInitial();
}

/// State indicating that data is being loaded
class EditCounterLoading extends EditCounterState {
  const EditCounterLoading();
}

/// State indicating that data was edited
class EditCounterData extends EditCounterState {
  final CounterModel? counterModel;
  const EditCounterData(this.counterModel);

  @override
  List<Object?> get props => [counterModel];
}

/// Error counter State
class EditCounterError extends EditCounterState {
  final String error;
  const EditCounterError(this.error);

  @override
  List<Object> get props => [error];
}
