import 'package:counter/data/counter/counter.repository.dart';
import 'package:counter/presentation/counter/counter.bloc.screen.dart';
import 'package:counter/presentation/counter/counter.riverpod.screen.dart';
import 'package:counter/presentation/counter/counter.screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final CounterRepository counterRepository;

  const MyApp({super.key, required this.counterRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(color: Theme.of(context).primaryColor),
        useMaterial3: true,
      ),
      home: CounterRiverpodScreen(),
    );
  }
}
