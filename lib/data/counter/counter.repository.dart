import 'package:bloc/bloc.dart';
import 'package:counter/data/counter/data_source/api/counter.api.dart';
import 'package:counter/data/counter/data_source/db/counter.db.dart';
import 'package:counter/domain/counter/model/counter.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.repository.g.dart';

@riverpod
class CounterRiverpodController extends _$CounterRiverpodController {
  @override
  Future<CounterEntity> build() {
    return Future.value(CounterEntity(value: 0));
  }

  Future<void> increment() async {
    CounterEntity currentValue = state.value!;
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 2));
    currentValue = currentValue.copyWith(value: currentValue.value + 1);
    if (currentValue.value > 5) {
      state = AsyncError('Level top high', StackTrace.fromString(''));
    } else {
      state = AsyncData(currentValue);
    }
  }

  Future<void> reset() async {
    ref.invalidate(counterRiverpodControllerProvider);
  }
}

class CounterRepositoryCubit extends Cubit<CounterEntity> {
  CounterRepositoryCubit(super.initialState);

  Future<void> increment() async {
    await Future.delayed(const Duration(seconds: 3), () {
      CounterEntity currentCounter = state;
      currentCounter = currentCounter.copyWith(value: currentCounter.value + 1);
      emit(currentCounter);
    });
  }
}

class CounterRepository {
  final CounterApi counterApi;
  final CounterDb counterDB;

  CounterEntity _internalCounter = CounterEntity(value: 0);

  get getCurrentCounter {
    return _internalCounter.value;
  }

  CounterRepository({required this.counterApi, required this.counterDB}) {
    counterApi
        .getInitalValue()
        .then((value) => _internalCounter = CounterEntity(value: value));
  }

  void increment() {
    _internalCounter =
        _internalCounter.copyWith(value: (_internalCounter.value) + 1);
  }
}
