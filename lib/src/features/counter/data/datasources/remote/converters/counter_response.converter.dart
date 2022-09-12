import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/core/extensions/color.extension.dart';

class CounterResponseConverter {
  CounterModel toModel(CounterResponseDto counterResponseDto) {
    return CounterModel(
      id: counterResponseDto.sysId,
      name: counterResponseDto.name,
      value: counterResponseDto.counterValue,
      stepSize: counterResponseDto.stepSize,
      startValue: counterResponseDto.startValue,
      color: counterResponseDto.color.toColor(),
      goalValue: counterResponseDto.goalValue,
    );
  }

  CounterResponseDto toDto(CounterModel counter) {
    return CounterResponseDto(
      sysId: counter.id,
      name: counter.name,
      counterValue: counter.value,
      stepSize: counter.stepSize,
      startValue: counter.value,
      color: '#${(counter.color.value & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}',
      goalValue: counter.goalValue,
    );
  }
}
