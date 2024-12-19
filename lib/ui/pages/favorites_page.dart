import 'package:coffee/domain/blocs/favorites_bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatelessWidget {
  final String userId;

  const FavoritesPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocProvider(
        create: (context) => FavoritesBloc()..loadFavorites(userId),
        child: BlocBuilder<FavoritesBloc, List<dynamic>>(
          builder: (context, favorites) {
            if (favorites.isEmpty) {
              return const Center(child: Text('No favorites found.'));
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return ListTile(
                  title: Text(favorite['name']),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
