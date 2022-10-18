import 'package:flutter/material.dart';

class CounterValueIndicator extends StatelessWidget {
  const CounterValueIndicator({Key? key, this.value}) : super(key: key);
  final int? value;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundColor: Colors.pink,
      child: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.grey.shade900,
        child: Text(
          value?.toString() ?? '0',
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
      ),
    );
  }
}
