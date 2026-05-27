import 'package:flutter/material.dart';

void main() {
  runApp(const ControlFlowApp());
}

class ControlFlowApp extends StatelessWidget {
  const ControlFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control Flow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
      home: const ControlFlowPage(),
    );
  }
}

class ControlFlowPage extends StatefulWidget {
  const ControlFlowPage({super.key});

  @override
  State<ControlFlowPage> createState() => _ControlFlowPageState();
}

class _ControlFlowPageState extends State<ControlFlowPage> {
  int score = 75;

  String getGrade(int value) {
    if (value >= 85) return 'A - Excellent';
    if (value >= 70) return 'B - Good';
    if (value >= 55) return 'C - Fair';
    return 'D - Needs Improvement';
  }

  List<String> buildNumberLabels() {
    final labels = <String>[];
    for (var i = 1; i <= 10; i++) {
      final type = i % 2 == 0 ? 'Even' : 'Odd';
      labels.add('$i is $type');
    }
    return labels;
  }

  @override
  Widget build(BuildContext context) {
    final labels = buildNumberLabels();

    return Scaffold(
      appBar: AppBar(title: const Text('Dart Control Flow')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Score: $score',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text('Grade: ${getGrade(score)}'),
          const SizedBox(height: 16),
          Slider(
            value: score.toDouble(),
            min: 0,
            max: 100,
            divisions: 100,
            label: score.toString(),
            onChanged: (value) => setState(() => score = value.round()),
          ),
          const Divider(),
          ...labels.map(
            (label) => ListTile(
              leading: const Icon(Icons.numbers),
              title: Text(label),
            ),
          ),
        ],
      ),
    );
  }
}
