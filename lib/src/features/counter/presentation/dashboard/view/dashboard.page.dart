import 'package:counter_workshop/src/features/counter/data/repositories/counter.repository.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.event.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.state.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/widgets/counter_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// bloc
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterRepository = context.read<CounterRepository>();
    return BlocProvider(
      create: (_) => DashboardBloc(counterRepository: counterRepository)..add(FetchCounterList()),
      child: const _DashboardView(),
    );
  }
}

/// actual counter page
class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoadingState) {
            // loading
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 3),
            );
          } else if (state is DashboardDataState) {
            // data
            return CounterGrid(counterList: state.counterList, columnCount: 2);
          } else if (state is DashboardErrorState) {
            // error
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Es ist ein Fehler aufgetreten: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          // state unknown, fallback to empty or return a common error
          return const SizedBox();
        },
      ),
    );
  }
}
