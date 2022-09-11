import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_response.dto.freezed.dart';

@freezed
class CounterResponseDto with _$CounterResponseDto {
  const factory CounterResponseDto({
    required String sysId,
    required int counterValue,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CounterResponseDto;
}
