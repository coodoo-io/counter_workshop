import 'package:counter_workshop/src/core/extensions/localization.extension.dart';
import 'package:counter_workshop/src/core/widgets/custom_loading_indicator.widget.dart';
import 'package:counter_workshop/src/core/widgets/error_message.widget.dart';
import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/bloc/edit_counter.state.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/widgets/counter_value_indicator.dart';
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
    final editCounterBloc = context.watch<EditCounterBloc>();
    final log = Logger('CounterView');
    final nameController = TextEditingController();
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => editCounterBloc.add(CounterCreate(CounterModel(name: nameController.text))),
            child: Text(context.loc.create, style: theme.textTheme.button),
          ),
        ],
      ),
      body: BlocConsumer<EditCounterBloc, EditCounterState>(
        listenWhen: (previous, current) {
          if (previous is EditCounterLoading && current is EditCounterData) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state is EditCounterData) {
            // Calling DashboardBloc (MasterPage) from EditCounterBloc (EditPage)
            log.info('EditBlocListener: ${state.counterModel?.name}');
            final dashboardBloc = context.read<DashboardBloc>();
            dashboardBloc.add(FetchCounterList());
            context.pop();
          }
        },
        builder: (context, state) {
          if (state is EditCounterLoading) {
            return const Center(child: CustomLoadingIndicator());
          }
          if (state is EditCounterData) {
            final counterModel = state.counterModel;

            return Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CounterValueIndicator(value: counterModel?.value),
                    const SizedBox(height: 80),
                    _NameInput(nameController: nameController),
                  ],
                ),
              ),
            );
          }
          if (state is EditCounterError) {
            return Center(child: ErrorMessage(error: state.error));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({Key? key, required this.nameController}) : super(key: key);
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditCounterBloc, EditCounterState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return TextField(
          controller: nameController,
          decoration: InputDecoration(hintText: context.loc.enterName),
        );
      },
    );
  }
}
