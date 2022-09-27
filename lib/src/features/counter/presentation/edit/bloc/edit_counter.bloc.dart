import 'dart:async';
import 'package:counter_workshop/src/core/logger/app_logger.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCounterBloc extends Bloc<EditCounterEvent, EditCounterState> {
  final CounterRepository counterRepository;

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
    appLogger.info('INCREMENT: ${event.counterModel.toString()}');
    final newCounterModel = event.counterModel.copyWith(value: event.counterModel.value + 1);
    emit(EditCounterData(newCounterModel));
    await counterRepository.updateCounter(id: event.counterModel.id, counterModel: newCounterModel);
  }

  Future<void> _onDecrement(CounterDecrementPressed event, Emitter<EditCounterState> emit) async {
    appLogger.info('DECREMENT: ${event.counterModel.toString()}');

    if (event.counterModel.value == 0) {
      return;
    }
    final newCounterModel = event.counterModel.copyWith(value: event.counterModel.value - 1);
    emit(EditCounterData(newCounterModel));
    await counterRepository.updateCounter(id: event.counterModel.id, counterModel: newCounterModel);
  }
}
