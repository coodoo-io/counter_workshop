import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Loading counter State
class CounterLoadingState extends CounterState {}

/// Data counter State
class CounterDataState extends CounterState {
  final List<CounterModel> counterList;
  CounterDataState(this.counterList);

  @override
  List<Object> get props => [counterList];
}

/// Error counter State
class CounterErrorState extends CounterState {
  final String error;

  CounterErrorState(this.error);

  @override
  List<Object> get props => [error];
}
