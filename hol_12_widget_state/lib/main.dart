import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetStateApp());
}

class WidgetStateApp extends StatelessWidget {
  const WidgetStateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless vs Stateful',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.lightBlue, useMaterial3: true),
      home: const CounterPage(),
    );
  }
}

class AppHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.info),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void increment() => setState(() => counter++);
  void decrement() => setState(() => counter--);
  void reset() => setState(() => counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StatelessWidget vs StatefulWidget')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AppHeader(
              title: 'Reusable StatelessWidget',
              subtitle: 'This header receives data but does not manage state.',
            ),
            const SizedBox(height: 32),
            Text(
              'Counter Value',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('$counter', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                FilledButton(onPressed: decrement, child: const Text('-')),
                FilledButton(onPressed: reset, child: const Text('Reset')),
                FilledButton(onPressed: increment, child: const Text('+')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
