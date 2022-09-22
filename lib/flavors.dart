enum Flavor {
  prod,
  stage,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Clicker';
      case Flavor.stage:
        return 'Stage Clicker';
      case Flavor.dev:
        return 'DEV Clicker';
      default:
        return 'title';
    }
  }
}
