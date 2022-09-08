import 'package:counter_workshop/src/feature/counter/data/repository/counter.repository.dart';
import 'package:counter_workshop/src/feature/counter/domain/counter.model.dart';

class CounterController {
  const CounterController({required this.counterRepository});

  final CounterRepository counterRepository;

  Counter get counter {
    return counterRepository.getCounter();
  }

  void increment() async {
    counterRepository.increment(amount: 1);
  }
}
