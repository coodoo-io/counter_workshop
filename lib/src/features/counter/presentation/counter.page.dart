import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/counter.controller.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({required this.counterRepository, super.key});
  final CounterRepository counterRepository;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final CounterController counterController;
  @override
  void initState() {
    counterController = CounterController(counterRepository: widget.counterRepository);
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      counterController.increment();
    });
  }

  void _decrementCounter() {
    setState(() {
      counterController.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${counterController.counterModel.value}',
              style: theme.textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _CustomCircularButton(
              icon: Icons.remove,
              onPressed: _decrementCounter,
            ),
            _CustomCircularButton(
              icon: Icons.add,
              onPressed: _incrementCounter,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCircularButton extends StatelessWidget {
  const _CustomCircularButton({required this.icon, this.onPressed});

  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 50,
      ),
    );
  }
}
