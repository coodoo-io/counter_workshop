import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: const Center(
        child: Text(
          'Make settings\n...',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
