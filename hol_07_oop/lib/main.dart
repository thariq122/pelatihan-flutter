import 'package:flutter/material.dart';

void main() {
  runApp(const OopApp());
}

class Product {
  final String name;
  final double price;
  final int stock;

  const Product({required this.name, required this.price, required this.stock});

  double get inventoryValue => price * stock;

  String get stockStatus {
    if (stock == 0) return 'Out of stock';
    if (stock < 5) return 'Low stock';
    return 'Available';
  }
}

class OopApp extends StatelessWidget {
  const OopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart OOP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.brown, useMaterial3: true),
      home: const ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    const products = [
      Product(name: 'Keyboard', price: 45.50, stock: 8),
      Product(name: 'Mouse', price: 18.75, stock: 3),
      Product(name: 'Monitor', price: 210.00, stock: 0),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Classes and Objects')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.stockStatus),
              trailing: Text('\$${product.inventoryValue.toStringAsFixed(2)}'),
            ),
          );
        },
      ),
    );
  }
}
