import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveLayoutApp());
}

class ResponsiveLayoutApp extends StatelessWidget {
  const ResponsiveLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.deepOrange, useMaterial3: true),
      home: const ResponsiveDashboardPage(),
    );
  }
}

class ResponsiveDashboardPage extends StatelessWidget {
  const ResponsiveDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final metrics = [
      ('Users', '1,240', Icons.people),
      ('Orders', '320', Icons.shopping_cart),
      ('Revenue', '\$8,750', Icons.attach_money),
      ('Tickets', '18', Icons.support_agent),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Dashboard')),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth >= 700 ? 4 : 2;

            return GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: columns,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: metrics.map((metric) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(metric.$3, size: 40),
                        const SizedBox(height: 12),
                        Text(metric.$1),
                        const SizedBox(height: 8),
                        Text(
                          metric.$2,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
