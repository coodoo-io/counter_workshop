import 'package:counter_workshop/src/core/widgets/custom_loading_indicator.widget.dart';
import 'package:counter_workshop/src/core/widgets/error_message.widget.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class EditCounterPage extends StatelessWidget {
  const EditCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = EditCounterBloc(counterRepository: context.read<CounterRepository>());

    return BlocProvider(
      create: (context) => bloc,
      child: const EditCounterView(),
    );
  }
}

class EditCounterView extends StatelessWidget {
  const EditCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final editCounterBloc = context.watch<EditCounterBloc>();
    final log = Logger('CounterView');

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              editCounterBloc.add(
                const CounterCreate(
                  CounterModel(
                    name: 'test',
                    value: 0,
                    color: Colors.white,
                    id: '9',
                    goalValue: 100,
                    startValue: 12,
                    stepSize: 1,
                  ),
                ),
              );
            },
            child: const Text('Done', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<EditCounterBloc, EditCounterState>(
          listenWhen: (previous, current) {
            if (previous is EditCounterLoading && current is EditCounterData) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is EditCounterData) {
              // Calling DashboardBloc (MasterPage) from DetailCounterBloc (DetailPage)
              log.info('EditBlocListener: ${state.counterModel?.name}');
              final dashboardBloc = context.read<DashboardBloc>();
              dashboardBloc.add(FetchCounterList());
              context.pop();
            }
          },
          builder: (context, state) {
            if (state is EditCounterLoading) {
              return const CustomLoadingIndicator();
            }
            if (state is EditCounterData) {
              return CounterValueIndicator(counterModel: state.counterModel);
            }
            if (state is EditCounterError) {
              return ErrorMessage(error: state.error);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class CounterValueIndicator extends StatelessWidget {
  const CounterValueIndicator({Key? key, this.counterModel}) : super(key: key);
  final CounterModel? counterModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.grey.shade900,
                child: Text(
                  counterModel?.value.toString() ?? '0',
                  style: const TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            const SizedBox(height: 80),
            _NameInput(name: counterModel?.name),
          ],
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCounterBloc, EditCounterState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return TextFormField(
          initialValue: name,
          // onChanged: (email) => context.read<EditCounterBloc>().emailChanged(email),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter a name',
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: Colors.grey.shade900,
            filled: true,
          ),
        );
      },
    );
  }
}
