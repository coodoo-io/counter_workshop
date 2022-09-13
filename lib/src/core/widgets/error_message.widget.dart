import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final Object error;

  const ErrorMessage({
    required this.error,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Es ist ein Fehler aufgetreten: ${error.toString()}',
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
