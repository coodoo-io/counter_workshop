import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/bloc/counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/bloc/counter.state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;

  CounterBloc({required this.counterRepository}) : super(const CounterState(value: 0)) {
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  void _onIncrement(CounterIncrementPressed event, Emitter<CounterState> emit) {
    debugPrint('INCREMENT: ${state.value.toString()}');
    emit(CounterState(value: state.value + 1));
  }

  void _onDecrement(CounterDecrementPressed event, Emitter<CounterState> emit) {
    debugPrint('DECREMENT: ${state.value.toString()}');
    if (state.value > 0) {
      emit(CounterState(value: state.value - 1));
    }
  }
}
