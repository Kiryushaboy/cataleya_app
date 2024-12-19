import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:coffee/domain/api/api_service.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Cubit<List<dynamic>> {
  final ApiService _apiService = ApiService();

  FavoritesBloc() : super([]);

  Future<void> loadFavorites(String userId) async {
    try {
      final response = await _apiService.fetchFavorites(userId);
      if (response.statusCode == 200) {
        emit(List<dynamic>.from(jsonDecode(response.data)));
      } else {
        emit([]);
      }
    } catch (_) {
      emit([]);
    }
  }
}
