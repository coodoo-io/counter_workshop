import 'dart:developer';

import 'package:counter_workshop/src/core/widgets/custom_loading_indicator.widget.dart';
import 'package:counter_workshop/src/core/widgets/error_message.widget.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/widgets/counter_text.widget.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/widgets/custom_circular_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCounterPage extends StatelessWidget {
  const EditCounterPage({this.counterId, super.key});
  final String? counterId;
  @override
  Widget build(BuildContext context) {
    final bloc = EditCounterBloc(
      counterRepository: context.read<CounterRepository>(),
      counterId: counterId,
    );
    // Fetch data if counterId is provider
    if (counterId != null) {
      bloc.add(FetchCounter(counterId!));
    }

    return BlocProvider(
      create: (context) => bloc,
      child: const CounterView(),
    );
  }
}

/// actual counter page
class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final editCounterBloc = context.watch<EditCounterBloc>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: BlocBuilder<EditCounterBloc, EditCounterState>(
          builder: (context, state) {
            return state is EditCounterData ? Text(state.counterModel.name) : const Text('');
          },
        ),
      ),
      body: BlocConsumer<EditCounterBloc, EditCounterState>(
        listenWhen: (previous, current) {
          if (previous is EditCounterData && current is EditCounterData) {
            if (previous.counterModel.value != current.counterModel.value) {
              return true;
            }
          }
          return false;
        },
        listener: (context, state) {
          if (state is EditCounterData) {
            // Calling DashboardBloc (MasterPage) from EditCounterBloc (DetailPage)
            log('EditBlocListener: ${state.counterModel.value}');
            final dashboardBloc = context.read<DashboardBloc>();
            dashboardBloc.add(FetchCounterList());
          }
        },
        builder: (context, state) {
          if (state is EditCounterLoading) {
            return const CustomLoadingIndicator();
          } else if (state is EditCounterData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterText(counterValue: state.counterModel.value),
                  Text(state.counterModel.name, style: theme.textTheme.caption),
                ],
              ),
            );
          } else if (state is EditCounterError) {
            return ErrorMessage(error: state.error);
          }
          return const SizedBox();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40.0),
        child: BlocBuilder<EditCounterBloc, EditCounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomCircularButton(
                  icon: Icons.remove,
                  onPressed: state is EditCounterData
                      ? () => editCounterBloc.add(CounterDecrementPressed(state.counterModel))
                      : null,
                ),
                CustomCircularButton(
                  icon: Icons.add,
                  onPressed: state is EditCounterData
                      ? () => editCounterBloc.add(CounterIncrementPressed(state.counterModel))
                      : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
