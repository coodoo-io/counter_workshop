import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/features/counter/presentation/edit/view/edit_counter.page.dart';
import 'package:flutter/material.dart';

class CounterGrid extends StatelessWidget {
  const CounterGrid({
    Key? key,
    required this.counterList,
    required this.columnCount,
  }) : super(key: key);

  final List<CounterModel> counterList;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: counterList.length,
      itemBuilder: (BuildContext ctx, index) {
        final counterModel = counterList[index];
        return Card(
          child: InkWell(
            onTap: () => Navigator.push(context, EditCounterPage.route(counterModel: counterModel)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${counterModel.value}', style: theme.textTheme.headlineLarge?.copyWith(fontSize: 60)),
                Text(counterModel.name, style: theme.textTheme.caption),
              ],
            ),
          ),
        );
      },
    );
  }
}
