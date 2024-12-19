import 'package:coffee/ui/resources/app_theme.dart';
import 'package:coffee/ui/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CoffeeRoasteryApp());
}

class CoffeeRoasteryApp extends StatelessWidget {
  const CoffeeRoasteryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.initial,
      routes: AppRoutes.routes,
    );
  }
}
