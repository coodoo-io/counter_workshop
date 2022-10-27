import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/detail_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/detail_counter.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class DetailCounterBloc extends Bloc<DetailCounterEvent, DetailCounterState> {
  final CounterRepository counterRepository;
  final log = Logger('CounterRepository');

  DetailCounterBloc({required this.counterRepository, required String? counterId})
      : super(const DetailCounterInitial()) {
    on<FetchCounter>(_onFetchCounter);
    on<CounterIncrementPressed>(_onIncrement);
    on<CounterDecrementPressed>(_onDecrement);
  }

  Future<FutureOr<void>> _onFetchCounter(FetchCounter event, Emitter<DetailCounterState> emit) async {
    try {
      emit(const DetailCounterLoading());
      final counterModel = await counterRepository.getCounter(id: event.counterId);
      emit(DetailCounterData(counterModel));
    } catch (e) {
      emit(DetailCounterError(e.toString()));
    }
  }

  Future<void> _onIncrement(CounterIncrementPressed event, Emitter<DetailCounterState> emit) async {
    log.info('INCREMENT: ${event.counterModel.toString()}');
    final newCounterModel = event.counterModel.copyWith(value: event.counterModel.value + 1);
    emit(DetailCounterData(newCounterModel));
    await counterRepository.updateCounter(id: event.counterModel.id, counterModel: newCounterModel);
  }

  Future<void> _onDecrement(CounterDecrementPressed event, Emitter<DetailCounterState> emit) async {
    log.info('DECREMENT: ${event.counterModel.toString()}');

    if (event.counterModel.value == 0) {
      return;
    }
    final newCounterModel = event.counterModel.copyWith(value: event.counterModel.value - 1);
    emit(DetailCounterData(newCounterModel));
    await counterRepository.updateCounter(id: event.counterModel.id, counterModel: newCounterModel);
  }
}
