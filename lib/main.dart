import 'package:flutter/material.dart';

import 'log/console_logger.dart';
import 'log/logger.dart';
import 'service/extensions.dart';
import 'service/service_provider.dart';
import 'service/services.dart';

void main() {
  runApp(
      Services(
        services: const [
          Singleton<Logger>(ConsoleLogger(defaultTag: 'Application'))
        ],
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.service<Logger>().d('Building application...');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const tag = 'Home';

  int _counter = 0;

  void _incrementCounter() {
    context.service<Logger>().v('Button clicked!', tag: tag);
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    context.service<Logger>().v('Scaffolding is getting built', tag: tag);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
