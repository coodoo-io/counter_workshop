import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  const CounterText(
      {super.key, required this.counterValue, required this.counterName});
  final int counterValue;
  final String counterName;

  @override
  Widget build(BuildContext context) {
    print('counter_text_$counterName');
    final theme = Theme.of(context);
    return Mark(
      name: 'counter_text_$counterName',
      child: Text(
        '$counterValue',
        style: theme.textTheme.headlineLarge,
      ),
    );
  }
}
