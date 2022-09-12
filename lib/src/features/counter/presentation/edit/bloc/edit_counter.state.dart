import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:equatable/equatable.dart';

class EditCounterState extends Equatable {
  const EditCounterState({required this.counterModel});

  final CounterModel counterModel;

  EditCounterState copyWith({
    CounterModel? counterModel,
  }) {
    return EditCounterState(counterModel: counterModel ?? this.counterModel);
  }

  @override
  List<Object> get props => [counterModel];
}
