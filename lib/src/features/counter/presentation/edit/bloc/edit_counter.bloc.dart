import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class EditCounterBloc extends Bloc<EditCounterEvent, EditCounterState> {
  final CounterRepository counterRepository;
  final log = Logger('CounterRepository');

  EditCounterBloc({required this.counterRepository, required String? counterId}) : super(const EditCounterInitial()) {
    on<FetchCounter>(_onFetchCounter);
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  Future<FutureOr<void>> _onFetchCounter(FetchCounter event, Emitter<EditCounterState> emit) async {
    try {
      emit(const EditCounterLoading());
      final counterModel = await counterRepository.getCounter(id: event.counterId);
      emit(EditCounterData(counterModel));
    } catch (e) {
      emit(EditCounterError(e.toString()));
    }
  }

  Future<void> _onIncrement(CounterIncrementPressed event, Emitter<EditCounterState> emit) async {
    log.info('INCREMENT: ${event.counterModel.toString()}');

    final newCounterModel = event.counterModel.copyWith(value: event.counterModel.value + 1);
    emit(EditCounterData(newCounterModel));
    await counterRepository.updateCounter(id: event.counterModel.id, counterModel: newCounterModel);

    FirebaseAnalytics.instance.logEvent(
      name: 'increment_counter',
      parameters: {
        'counterID': newCounterModel.id,
        'counterName': newCounterModel.name,
        'execution': 'increment',
        'previousValue': event.counterModel.value,
        'currentValue': newCounterModel.value,
      },
    );
  }

  Future<void> _onDecrement(CounterDecrementPressed event, Emitter<EditCounterState> emit) async {
    log.info('DECREMENT: ${event.counterModel.toString()}');

    if (event.counterModel.value == 0) {
      return;
    }
    final newCounterModel = event.counterModel.copyWith(value: event.counterModel.value - 1);
    emit(EditCounterData(newCounterModel));
    await counterRepository.updateCounter(id: event.counterModel.id, counterModel: newCounterModel);

    FirebaseAnalytics.instance.logEvent(
      name: 'decrement_counter',
      parameters: {
        'counterID': newCounterModel.id,
        'counterName': newCounterModel.name,
        'execution': 'decrement',
        'previousValue': event.counterModel.value,
        'currentValue': newCounterModel.value,
      },
    );
  }
}
