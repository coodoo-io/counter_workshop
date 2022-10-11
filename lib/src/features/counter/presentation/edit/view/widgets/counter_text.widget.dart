import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key, required this.counterValue});
  final int counterValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Mark(
        name: 'counter_text',
        child: Text(
          '$counterValue',
          style: theme.textTheme.headlineLarge,
        ));
  }
}
