import 'dart:io';

import 'package:counter/data/counter/counter.repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage(
      {super.key, required this.title, required this.counterRepository});

  final String title;
  final CounterRepository counterRepository;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${widget.counterRepository.getCurrentCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.counterRepository.increment();
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
