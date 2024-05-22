import 'package:build_your_own_code/log/console_logger.dart';
import 'package:build_your_own_code/log/logger.dart';
import 'package:build_your_own_code/service/service_provider.dart';
import 'package:build_your_own_code/service/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:build_your_own_code/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
        Services(
          services: const [
            Singleton<Logger>(ConsoleLogger(defaultTag: 'Application'))
          ],
          child: const MyApp(),
        )
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
