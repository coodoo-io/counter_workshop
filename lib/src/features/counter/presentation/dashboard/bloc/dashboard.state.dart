import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DashboardState extends Equatable {
  @override
  List<Object> get props => [];
}

/// Loading counter State
class DashboardLoadingState extends DashboardState {}

/// Data counter State
class DashboardDataState extends DashboardState {
  final List<CounterModel> counterList;
  DashboardDataState(this.counterList);

  @override
  List<Object> get props => [counterList];
}

/// Error counter State
class DashboardErrorState extends DashboardState {
  final String error;

  DashboardErrorState(this.error);

  @override
  List<Object> get props => [error];
}
