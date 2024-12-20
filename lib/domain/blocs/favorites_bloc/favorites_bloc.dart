// import 'package:meta/meta.dart';

// part 'favorites_event.dart';
// part 'favorites_state.dart';

// class FavoritesBloc {
//   final _favoritesController = StreamController<List<String>>.broadcast();
//   List<String> _favorites = [];

//   Stream<List<String>> get favoritesStream => _favoritesController.stream;

//   void addFavorite(String itemId) {
//     _favorites.add(itemId);
//     _favoritesController.sink.add(_favorites);
//   }

//   void dispose() {
//     _favoritesController.close();
//   }
// }
