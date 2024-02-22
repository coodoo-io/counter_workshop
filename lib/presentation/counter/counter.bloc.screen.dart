import 'package:counter/data/counter/counter.repository.dart';
import 'package:counter/domain/counter/model/counter.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBLocPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterRepositoryCubit(CounterEntity(value: 0)),
      child: CounterBlocView(),
    );
  }
}

class CounterBlocView extends StatefulWidget {
  @override
  State<CounterBlocView> createState() => _CounterBlocViewState();
}

class _CounterBlocViewState extends State<CounterBlocView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final counterRepository = context.watch<CounterRepositoryCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Counter Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            isLoading
                ? CircularProgressIndicator()
                : Text(
                    '${counterRepository.state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          isLoading = true;
          setState(() {});
          await counterRepository.increment();
          isLoading = false;
          setState(() {});

          ///close overlay
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
