class CounterApi {
  Future<int> getInitalValue() async {
    return Future.delayed(const Duration(seconds: 1), () => -10);
  }
}
