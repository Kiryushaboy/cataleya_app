import 'package:flutter/material.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';
import '../pages/favorites_page.dart';

class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const favorites = '/favorites';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => LoginPage(),
    home: (context) => const HomePage(),
    favorites: (context) =>
        const FavoritesPage(userId: '1'), // Replace '1' with actual userId
  };
}
