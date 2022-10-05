import 'package:counter_workshop/src/core/extensions/localization.extension.dart';
import 'package:counter_workshop/src/core/widgets/error_message.widget.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.bloc.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/bloc/dashboard.state.dart';
import 'package:counter_workshop/src/features/counter/presentation/dashboard/view/widgets/counter_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// bloc
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(context.loc.appTitle),
        actions: [IconButton(onPressed: () => context.push('/settings'), icon: const Icon(Icons.snowboarding))],
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
            return ErrorMessage(error: state.error);
          }
          // state unknown, fallback to empty or return a common error
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.go('/counters/new');
        },
      ),
    );
  }
}
