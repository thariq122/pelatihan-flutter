import 'package:flutter/material.dart';

void main() {
  runApp(const EnvironmentCheckApp());
}

class EnvironmentCheckApp extends StatelessWidget {
  const EnvironmentCheckApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Environment Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const EnvironmentCheckPage(),
    );
  }
}

class EnvironmentCheckPage extends StatelessWidget {
  const EnvironmentCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    final checks = [
      'Flutter SDK is installed',
      'Editor is configured',
      'Emulator or device is connected',
      'Application can run successfully',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Environment Check')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: checks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(checks[index]),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
