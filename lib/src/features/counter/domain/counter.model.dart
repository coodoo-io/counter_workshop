import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.model.freezed.dart';

@freezed
class CounterModel with _$CounterModel {
  const factory CounterModel({
    @Default('1') String id,
    @Default(0) int value,
  }) = _CounterModel;
}
