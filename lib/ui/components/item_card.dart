import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final VoidCallback onFavoriteToggle;

  const ItemCard({
    super.key,
    required this.title,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}
