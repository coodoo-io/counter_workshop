import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.entity.freezed.dart';

@Freezed()
class CounterEntity with _$CounterEntity {
  factory CounterEntity({required int value}) = _CounterEntity;
}
