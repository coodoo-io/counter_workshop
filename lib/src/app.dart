import 'package:counter_workshop/src/feature/counter/data/repository/counter.repository.dart';
import 'package:counter_workshop/src/feature/counter/presentation/counter.page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({required this.counterRepository, super.key});
  final CounterRepository counterRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(counterRepository: counterRepository),
    );
  }
}
