import 'package:counter_workshop/src/core/extensions/localization.extension.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key, required this.nameController}) : super(key: key);
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCounterBloc, EditCounterState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return TextFormField(
          controller: nameController,
          decoration: InputDecoration(hintText: context.loc.setName),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.loc.setName;
            }
            return null;
          },
        );
      },
    );
  }
}
