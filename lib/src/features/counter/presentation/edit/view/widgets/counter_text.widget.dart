import 'package:flutter/material.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key, required this.counterValue});
  final int counterValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      '$counterValue',
      style: theme.textTheme.headlineLarge,
    );
  }
}
