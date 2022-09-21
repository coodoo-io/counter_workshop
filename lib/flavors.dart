enum Flavor {
  stage,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.stage:
        return 'STAGE Clicker';
      case Flavor.dev:
        return 'DEV Clicker';
      default:
        return 'title';
    }
  }

}
