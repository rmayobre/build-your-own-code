import 'package:flutter/widgets.dart';

import 'service_provider.dart';

final class ServiceLocator {
  ServiceLocator(List<ServiceProvider> services)
      : _services = {for (final provider in services) provider.key: provider};

  final Map<Type, ServiceProvider> _services;

  T locate<T extends Object>(BuildContext context) {
    final ServiceProvider? provider = _services[T];
    if (provider == null) {
      throw StateError('${T.toString()} was not provided to ServiceLocator');
    }
    switch (provider) {
      case Singleton():
        return provider.service as T;
      case LazySingleton():
        return provider.create(context) as T;
      case Factory():
        return provider.create(context) as T;
    }
  }
}
