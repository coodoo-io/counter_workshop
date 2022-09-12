import 'package:counter_workshop/src/features/counter/data/datasources/remote/converters/counter_response.converter.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/dtos/counter_response.dto.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const model = CounterModel(
    value: 1,
    id: '1',
    name: 'Kaffee',
    color: Color(0xffff3300),
  );
  final dto = CounterResponseDto(
    counterValue: 1,
    sysId: '1',
    name: 'Kaffee',
  );
  group('Counter Response Converter', () {
    test('should be convert to model', () {
      expect(CounterResponseConverter().toModel(dto), model);
    });

    test('should be convert to dto', () {
      expect(CounterResponseConverter().toDto(model), dto);
    });
  });

  group('Counter Response Converter', () {
    test('convert hex to color', () {
      final model = CounterResponseConverter().toModel(dto);
      expect(model.color, const Color(0xffff3300));
    });

    test('convert color to hex', () {
      final dto = CounterResponseConverter().toDto(model);
      expect(dto.color, '#ff3300');
    });
  });
}
