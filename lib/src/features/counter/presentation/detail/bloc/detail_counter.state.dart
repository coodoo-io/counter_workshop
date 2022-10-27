import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class DetailCounterState extends Equatable {
  const DetailCounterState();
  @override
  List<Object> get props => [];
}

/// The initial Counter State
class DetailCounterInitial extends DetailCounterState {
  const DetailCounterInitial();
}

/// State indicating that data is being loaded
class DetailCounterLoading extends DetailCounterState {
  const DetailCounterLoading();
}

/// State indicating that data was loaded
class DetailCounterData extends DetailCounterState {
  final CounterModel counterModel;
  const DetailCounterData(this.counterModel);
  @override
  List<Object> get props => [counterModel];
}

/// Error counter State
class DetailCounterError extends DetailCounterState {
  final String error;
  const DetailCounterError(this.error);
  @override
  List<Object> get props => [error];
}
