import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = "https://api.example.com";
  final Dio _dio;

  ApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            headers: {'Content-Type': 'application/json'},
            connectTimeout: const Duration(
                milliseconds:
                    5000), // Время ожидания подключения в миллисекундах
            receiveTimeout: const Duration(
                milliseconds: 3000), // Время ожидания ответа в миллисекундах
          ),
        );

  Future<Response> login(String username, String password) async {
    try {
      return await _dio.post(
        '/login',
        data: jsonEncode({'username': username, 'password': password}),
      );
    } on DioException catch (e) {
      // Обработка ошибок
      return Future.error(e.response?.data ?? 'Произошла ошибка');
    }
  }

  Future<Response> fetchFavorites(String userId) async {
    try {
      return await _dio.get('/users/$userId/favorites');
    } on DioException catch (e) {
      // Обработка ошибок
      return Future.error(e.response?.data ?? 'Произошла ошибка');
    }
  }
}
