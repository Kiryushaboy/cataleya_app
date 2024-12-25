import 'package:coffee/ui/body/cart_page.dart';
import 'package:coffee/ui/body/catalog_page.dart';
import 'package:coffee/ui/body/favorites_page.dart';
import 'package:coffee/ui/body/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Список виджетов для отображения на каждой вкладке
  final List<Widget> _pages = [
    const CatalogPage(),
    const FavoritesPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Меняем текущий индекс при выборе вкладки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Отображаем текущую страницу
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Убедимся, что тип fixed
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white, // Цвет выбранного элемента
        unselectedItemColor: Colors.white, // Цвет невыбранных элементов
      ),
    );
  }
}
