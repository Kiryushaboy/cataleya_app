import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));

  Future<Response> fetchFavorites() async {
    return await _dio.get('/favorites');
  }

  Future<Response> addToFavorites(String itemId) async {
    return await _dio.post('/favorites', data: {'itemId': itemId});
  }
}
