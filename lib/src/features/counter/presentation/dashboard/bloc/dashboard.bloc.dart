import 'dart:async';

import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final CounterRepository counterRepository;

  DashboardBloc({required this.counterRepository}) : super(DashboardLoadingState()) {
    on<FetchCounterList>(_onFetchCounterList);
  }

  Future<FutureOr<void>> _onFetchCounterList(FetchCounterList event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());
    try {
      final counter = await counterRepository.getCounterList();
      emit(DashboardDataState(counter));
    } catch (e) {
      emit(DashboardErrorState(e.toString()));
    }
  }
}
