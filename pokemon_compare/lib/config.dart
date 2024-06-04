class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'QAS';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.PRODUCTION;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': '',
    },
    {
      'env': Environments.DEV,
      'url': 'https://pokeapi.co/api/v2/',
    },
    {
      'env': Environments.QAS,
      'url': '',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://pokeapi.co/api/v2/',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
