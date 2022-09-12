import 'package:counter_workshop/src/app.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/local/counter.db.dart';
import 'package:counter_workshop/src/features/counter/data/datasources/remote/src/mock/counter_fake.api.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
      name: 'STAGE',
      color: Colors.blue,
      location: BannerLocation.bottomStart,
      variables: {'env': 'STAGE', 'API_URL': ''});

  final CounterRepository counterRepository =
      CounterRepository(counterApi: CounterFakeApi(), counterDatabase: CounterDatabase());
  runApp(
    App(
      counterRepository: counterRepository,
    ),
  );
}
