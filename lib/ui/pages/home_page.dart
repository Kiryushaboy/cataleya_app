import 'package:coffee/ui/body/catalog_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
      ),
      body: const CatalogBodyWidget(),
    );
  }
}
