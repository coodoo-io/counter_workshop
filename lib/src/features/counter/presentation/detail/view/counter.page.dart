import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/bloc/counter.state.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/view/widgets/counter_text.widget.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/view/widgets/custom_circular_button.widget.dart';
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
      child: const _CounterView(),
    );
  }
}

/// actual counter page
class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    // final showButton = false;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterLoadingState) {
            // loading
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 3),
            );
          } else if (state is CounterDataState) {
            // data
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterText(counterValue: state.counterList[0].value),
                ],
              ),
            );
          } else if (state is CounterErrorState) {
            // error
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Es ist ein Fehler aufgetreten: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          // state unknown, fallback to empty or return a common error
          return const SizedBox();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomCircularButton(
                  icon: Icons.remove,
                  onPressed: state is CounterDataState
                      ? () => counterBloc.add(CounterDecrementPressed(state.counterList[0]))
                      : null,
                ),
                CustomCircularButton(
                  icon: Icons.add,
                  onPressed: state is CounterDataState
                      ? () => counterBloc.add(CounterIncrementPressed(state.counterList[0]))
                      : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
