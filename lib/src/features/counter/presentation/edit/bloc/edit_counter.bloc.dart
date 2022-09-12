import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCounterBloc extends Bloc<EditCounterEvent, EditCounterState> {
  final CounterRepository counterRepository;

  EditCounterBloc({required this.counterRepository, required CounterModel counterModel})
      : super(
          EditCounterState(counterModel: counterModel),
        ) {
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  Future<void> _onIncrement(CounterIncrementPressed event, Emitter<EditCounterState> emit) async {
    debugPrint('INCREMENT: ${state.counterModel.toString()}');
    final newCounterModel = state.counterModel.copyWith(value: state.counterModel.value + 1);
    emit(EditCounterState(counterModel: newCounterModel));
    counterRepository.updateCounter(id: state.counterModel.id, counterModel: newCounterModel);
  }

  Future<void> _onDecrement(CounterDecrementPressed event, Emitter<EditCounterState> emit) async {
    debugPrint('DECREMENT: ${state.counterModel.toString()}');

    if (event.counterModel.value == 0) {
      return;
    }
    final newCounterModel = state.counterModel.copyWith(value: state.counterModel.value - 1);
    emit(EditCounterState(counterModel: newCounterModel));
  }
}
