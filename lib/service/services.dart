import 'package:flutter/widgets.dart';

import 'service_locator.dart';
import 'service_provider.dart';

final class Services extends InheritedWidget {
  Services({
    super.key,
    required List<ServiceProvider> services,
    required super.child
  }) : locator = ServiceLocator(services);

  static T of<T extends Object>(BuildContext context) {
    return context
        .getInheritedWidgetOfExactType<Services>()!
        .locator
        .locate<T>(context);
  }

  final ServiceLocator locator;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}