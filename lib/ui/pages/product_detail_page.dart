import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String? productId;

  const ProductDetailPage({this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали товара'),
      ),
      body: Center(
        child: Text('Товар ID: $productId'),
      ),
    );
  }
}
