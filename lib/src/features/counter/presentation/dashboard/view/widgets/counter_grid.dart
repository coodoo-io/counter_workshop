import 'package:counter_workshop/src/features/counter/domain/model/counter.model.dart';
import 'package:counter_workshop/src/features/counter/presentation/detail/view/counter.page.dart';
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
        final counter = counterList[index];
        return Card(
          child: InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterPage())),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${counter.value}', style: theme.textTheme.headlineLarge?.copyWith(fontSize: 60)),
                Text(counter.name, style: theme.textTheme.caption),
              ],
            ),
          ),
        );
      },
    );
  }
}
