import 'package:counter_workshop/src/features/counter/presentation/bloc/counter.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final counterValue = context.select((CounterBloc bloc) => bloc.state.value);
    return Text(
      '$counterValue',
      style: theme.textTheme.headlineLarge,
    );
  }
}
