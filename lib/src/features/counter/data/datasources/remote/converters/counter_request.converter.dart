import 'package:counter_workshop/src/core/extensions/color.extension.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_request.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';

class CounterRequestConverter {
  CounterModel toModel(CounterRequestDto counterRequestDto) {
    return CounterModel(
      id: counterRequestDto.sysId,
      name: counterRequestDto.name,
      value: counterRequestDto.counterValue,
      stepSize: counterRequestDto.stepSize,
      startValue: counterRequestDto.startValue,
      color: counterRequestDto.color.toColor(),
      goalValue: counterRequestDto.goalValue,
    );
  }

  CounterRequestDto toDto(CounterModel counter) {
    return CounterRequestDto(
      name: counter.name,
      counterValue: counter.value,
      stepSize: counter.stepSize,
      startValue: counter.value,
      color: '#${(counter.color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}',
      goalValue: counter.goalValue,
    );
  }
}
