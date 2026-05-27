import 'package:flutter/material.dart';

void main() {
  runApp(const CollectionsApp());
}

class CollectionsApp extends StatelessWidget {
  const CollectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Collections',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.purple, useMaterial3: true),
      home: const CollectionsPage(),
    );
  }
}

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> courses = ['Flutter', 'Dart', 'UI Design', 'REST API'];
    final Set<String> uniqueSkills = {'Mobile', 'Frontend', 'Mobile', 'API'};
    final Map<String, int> courseHours = {
      'Flutter': 12,
      'Dart': 8,
      'UI Design': 6,
      'REST API': 10,
    };

    final totalHours = courseHours.values.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(title: const Text('Lists, Sets, and Maps')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Course List', style: Theme.of(context).textTheme.titleLarge),
          ...courses.map((course) => ListTile(title: Text(course))),
          const Divider(),
          Text('Unique Skills', style: Theme.of(context).textTheme.titleLarge),
          Wrap(
            spacing: 8,
            children: uniqueSkills
                .map((skill) => Chip(label: Text(skill)))
                .toList(),
          ),
          const Divider(),
          Text('Course Hours', style: Theme.of(context).textTheme.titleLarge),
          ...courseHours.entries.map(
            (entry) => ListTile(
              title: Text(entry.key),
              trailing: Text('${entry.value} hours'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Total Learning Hours'),
              trailing: Text('$totalHours hours'),
            ),
          ),
        ],
      ),
    );
  }
}
