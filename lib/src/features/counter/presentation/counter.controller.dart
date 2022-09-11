import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

class CounterController {
  CounterController({required this.counterRepository}) {
    counterModel = counterRepository.getCounter();
  }

  final CounterRepository counterRepository;
  CounterModel counterModel = const CounterModel();

  Future<void> increment() async {
    counterModel = counterModel.copyWith(value: counterModel.value + 1);
    counterRepository.updateCounter(counterModel: counterModel);
  }
}
