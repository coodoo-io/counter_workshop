import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/bloc/counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/bloc/counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/view/widgets/counter_text.widget.dart';
import 'package:counter_workshop/src/features/counter/presentation/view/widgets/custom_circular_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// bloc
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterRepository = context.read<CounterRepository>();
    return BlocProvider(
        create: (_) => CounterBloc(counterRepository: counterRepository),
        child: const _CounterView());
  }
}

/// actual counter page
class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CounterText(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomCircularButton(
              icon: Icons.remove,
              onPressed: () => counterBloc.add(CounterDecrementPressed()),
            ),
            CustomCircularButton(
              icon: Icons.reset_tv,
              onPressed: () => counterBloc.add(CounterReset()),
            ),
            CustomCircularButton(
              icon: Icons.add,
              onPressed: () => counterBloc.add(CounterIncrementPressed()),
            ),
          ],
        ),
      ),
    );
  }
}
