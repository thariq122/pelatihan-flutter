import 'package:flutter/material.dart';

void main() {
  runApp(const FunctionsApp());
}

class FunctionsApp extends StatelessWidget {
  const FunctionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Functions',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final firstController = TextEditingController(text: '10');
  final secondController = TextEditingController(text: '5');
  String result = 'Result will appear here';

  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  String divide(double a, double b) {
    if (b == 0) return 'Cannot divide by zero';
    return (a / b).toStringAsFixed(2);
  }

  void calculate(String operation) {
    final a = double.tryParse(firstController.text) ?? 0;
    final b = double.tryParse(secondController.text) ?? 0;

    setState(() {
      switch (operation) {
        case 'add':
          result = add(a, b).toString();
          break;
        case 'subtract':
          result = subtract(a, b).toString();
          break;
        case 'multiply':
          result = multiply(a, b).toString();
          break;
        case 'divide':
          result = divide(a, b);
          break;
      }
    });
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttons = {
      'Add': 'add',
      'Subtract': 'subtract',
      'Multiply': 'multiply',
      'Divide': 'divide',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('Dart Function Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'First number'),
            ),
            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Second number'),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: buttons.entries
                  .map(
                    (entry) => FilledButton(
                      onPressed: () => calculate(entry.value),
                      child: Text(entry.key),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            Text(result, style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
