import 'package:counter_workshop/src/features/counter/data/datasources/remote/counter.api.dart';
import 'package:counter_workshop/src/features/counter/domain/counter.model.dart';

/// Remote graphQL API that providers a [Counter]
class CounterGraphqlApi implements CounterApi {
  CounterGraphqlApi(this.graphQLClient);
  final dynamic graphQLClient;

  @override
  Future<Counter> fetchCounter(String id) {
    // TODO: Implement
    return graphQLClient.fetchCounter();
  }
}
