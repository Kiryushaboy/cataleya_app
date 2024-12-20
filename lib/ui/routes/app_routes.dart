import 'package:coffee/ui/pages/home_page.dart';
import 'package:coffee/ui/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/product-detail/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id'];
        return ProductDetailPage(productId: productId);
      },
    ),
  ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Страница не найдена!'),
    ),
  ),
);
