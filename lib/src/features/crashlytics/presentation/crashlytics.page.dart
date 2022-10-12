import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsPage extends StatelessWidget {
  const CrashlyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crashlytics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () => throw Exception(),
                child: const Text('Throw Exception'),
              ),
              OutlinedButton(
                onPressed: () {
                  FirebaseCrashlytics.instance.log('Yeah. You found the log-button');
                  throw Exception('Exception with log');
                },
                child: const Text('Log'),
              ),
              OutlinedButton(
                onPressed: () => FirebaseCrashlytics.instance.crash(),
                child: const Text('Crash'),
              ),
              OutlinedButton(
                onPressed: () {
                  FirebaseCrashlytics.instance.setCustomKey('str_key', 'hello');
                  throw Exception('Custom Key');
                },
                child: const Text('Custom Key'),
              ),
              OutlinedButton(
                onPressed: () => FirebaseCrashlytics.instance.setUserIdentifier('12345'),
                child: const Text('User Identifier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
