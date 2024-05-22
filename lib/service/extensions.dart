import 'package:flutter/widgets.dart';

import 'services.dart';

extension ServiceExtensions on BuildContext {
  T service<T extends Object>() => Services.of(this);
}
