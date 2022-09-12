import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/counter.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;

  CounterBloc({required this.counterRepository}) : super(CounterLoadingState()) {
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  Future<void> _onIncrement(CounterIncrementPressed event, Emitter<CounterState> emit) async {
    // debugPrint('INCREMENT: ${event.counterModel.toString()}');
    // emit(CounterLoadingState());
    // try {
    //   event.counterModel.value += 1;
    //   await counterRepository.updateCounter(counterModel: event.counterModel);
    //   emit(CounterDataState(event.counterModel));
    // } catch (e) {
    //   emit(CounterErrorState(e.toString()));
    // }
  }

  Future<void> _onDecrement(CounterDecrementPressed event, Emitter<CounterState> emit) async {
    // debugPrint('DECREMENT: ${event.counterModel.toString()}');

    // if (event.counterModel.value == 0) {
    //   return;
    // }

    // emit(CounterLoadingState());
    // try {
    //   event.counterModel.value -= 1;
    //   await counterRepository.updateCounter(counterModel: event.counterModel);
    //   emit(CounterDataState(event.counterModel));
    // } catch (e) {
    //   emit(CounterErrorState(e.toString()));
    // }
  }
}
