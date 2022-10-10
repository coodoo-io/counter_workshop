enum Flavor {
  prod,
  stage,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';
  static bool get isProduction => appFlavor?.name == Flavor.prod.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.stage:
        return '[STAGE] Counter';
      case Flavor.dev:
        return '[DEV] Counter';
      case Flavor.prod:
      default:
        return 'Counter';
    }
  }
}
