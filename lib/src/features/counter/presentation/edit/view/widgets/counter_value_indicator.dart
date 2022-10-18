import 'package:counter_workshop/src/core/utils/color.util.dart';
import 'package:flutter/material.dart';

class CounterValueIndicator extends StatelessWidget {
  const CounterValueIndicator({Key? key, this.value}) : super(key: key);
  final int? value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: 80,
      backgroundColor: ColorUtil.isDarkMode(theme) ? Colors.white : Colors.grey.shade900,
      child: CircleAvatar(
        radius: 65,
        backgroundColor: ColorUtil.isDarkMode(theme) ? Colors.grey.shade900 : Colors.grey.shade300,
        child: Text(
          value?.toString() ?? '0',
          style: theme.textTheme.headline2,
        ),
      ),
    );
  }
}
