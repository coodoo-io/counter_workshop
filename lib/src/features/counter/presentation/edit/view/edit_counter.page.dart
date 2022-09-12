import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/widgets/counter_text.widget.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/widgets/custom_circular_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// bloc
class EditCounterPage extends StatelessWidget {
  const EditCounterPage({super.key});

  static Route<void> route({required CounterModel counterModel, bool fullscreen = false}) {
    return MaterialPageRoute(
      fullscreenDialog: fullscreen,
      builder: (context) => BlocProvider(
        create: (context) => EditCounterBloc(
          counterRepository: context.read<CounterRepository>(),
          counterModel: counterModel,
        ),
        child: const EditCounterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const CounterView();
  }
}

/// actual counter page
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final editCounterBloc = context.watch<EditCounterBloc>();
    final counterModel = editCounterBloc.state.counterModel;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterText(counterValue: counterModel.value),
            Text(counterModel.name, style: theme.textTheme.caption),
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
              onPressed: () => editCounterBloc.add(CounterDecrementPressed(counterModel)),
            ),
            CustomCircularButton(
              icon: Icons.add,
              onPressed: () => editCounterBloc.add(CounterIncrementPressed(counterModel)),
            ),
          ],
        ),
      ),
    );
  }
}
