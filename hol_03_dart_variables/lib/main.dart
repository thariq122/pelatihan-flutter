import 'package:flutter/material.dart';

void main() {
  runApp(const DartBasicsApp());
}

class DartBasicsApp extends StatelessWidget {
  const DartBasicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Basics',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const DartBasicsPage(),
    );
  }
}

class DartBasicsPage extends StatelessWidget {
  const DartBasicsPage({super.key});

  Map<String, String> buildStudentProfile() {
    const String name = 'Alex';
    const int age = 18;
    const double gpa = 3.75;
    const bool isGraduated = true;

    final int nextAge = age + 1;
    final String status = isGraduated ? 'Graduated' : 'Still studying';

    return {
      'Name': name,
      'Age': age.toString(),
      'Next Year Age': nextAge.toString(),
      'GPA': gpa.toStringAsFixed(2),
      'Status': status,
    };
  }

  @override
  Widget build(BuildContext context) {
    final profile = buildStudentProfile();

    return Scaffold(
      appBar: AppBar(title: const Text('Dart Variables and Data Types')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: profile.entries.map((entry) {
          return Card(
            child: ListTile(
              title: Text(entry.key),
              subtitle: Text(entry.value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
