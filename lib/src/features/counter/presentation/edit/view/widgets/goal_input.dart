import 'package:counter_workshop/src/core/extensions/localization.extension.dart';
import 'package:flutter/material.dart';

class GoalInput extends StatelessWidget {
  const GoalInput({
    Key? key,
    required this.goalController,
  }) : super(key: key);

  final TextEditingController goalController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: goalController,
      decoration: InputDecoration(
        hintText: context.loc.setGoal,
        prefixIcon: const Icon(Icons.flag_outlined),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }

        if (int.tryParse(value) == null) {
          return context.loc.enterValidNumber;
        }

        if (int.parse(value) < 0) {
          return context.loc.enterPositiveNumber;
        }

        return null;
      },
    );
  }
}
