import 'package:coffee/ui/components/favorite_card_widget.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  // Моковые данные для избранного
  final List<Map<String, String>> favoriteProducts = [
    {
      "name": "Кофе Арабика",
      "price": "120 000 сум",
      "image": "https://via.placeholder.com/150"
    },
    {
      "name": "Кофе Латте",
      "price": "80 000 сум",
      "image": "https://via.placeholder.com/150"
    },
  ];

  // Метод для удаления товара из избранного
  void removeFromFavorites(int index) {
    setState(() {
      favoriteProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Избранное"),
        backgroundColor: Colors.brown,
      ),
      body: favoriteProducts.isEmpty
          ? const Center(
              child: Text(
                "Ваш список избранного пуст",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                return FavoriteCardWidget(
                  name: favoriteProducts[index]["name"]!,
                  price: favoriteProducts[index]["price"]!,
                  image: favoriteProducts[index]["image"]!,
                  onRemove: () => removeFromFavorites(index),
                );
              },
            ),
    );
  }
}
