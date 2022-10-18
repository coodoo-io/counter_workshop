import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

class EditCounterBloc extends Bloc<EditCounterEvent, EditCounterState> {
  final CounterRepository counterRepository;
  final log = Logger('CounterRepository');

  EditCounterBloc({required this.counterRepository}) : super(const EditCounterData(null)) {
    on<CounterCreate>(_onCreateCounter);
  }

  Future<FutureOr<void>> _onCreateCounter(CounterCreate event, Emitter<EditCounterState> emit) async {
    try {
      emit(const EditCounterLoading());
      final counterModel = await counterRepository.createCounter(counterModel: event.counterModel);
      emit(EditCounterData(counterModel));
    } catch (e) {
      emit(EditCounterError(e.toString()));
    }
  }
}
