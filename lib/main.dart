import 'package:flutter/material.dart';

import 'log/console_logger.dart';
import 'log/logger.dart';

void main() {
  const logger = ConsoleLogger(defaultTag: 'Application');
  runApp(const MyWidget(log: logger));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.log});

  static const _tag = 'MyWidget';

  final Logger log;

  @override
  Widget build(BuildContext context) {
    log.i('Building my widget...', tag: _tag);
    try {
      throw Exception('MyWidget is throwing an Exception!');
    } on Exception catch (exception, stacktrace) {
      log.e('Error occurred', tag: _tag, error: exception, stacktrace: stacktrace);
    }
    return const MaterialApp(
      home: Text('Hello, World!'),
    );
  }
}