import 'package:coffee/domain/models/test_products.dart';
import 'package:dio/dio.dart';

abstract class ApiService {
  static final Dio dio = Dio();
  static const link =
      "https://fakerapi.it/api/v2/products?_quantity=30&_taxes=0&_categories_type=uuid&_price_min=2&_price_max=300";

  Future<List<dynamic>> getProducts() async {
    //https://example.com/api/products
    try {
      final response = await dio.get(link);
      if (response.statusCode == 200) {
        return response.data; // API возвращает список товаров
      } else {
        throw Exception('Ошибка при получении данных');
      }
    } catch (e) {
      throw Exception('Ошибка при получении данных: $e');
    }
  }

  static Future<TestProducts> getNowProducts() async {
    final testProductsResponse = await dio.get(link);
    try {
      final testProducts = TestProducts.fromJson(testProductsResponse.data);
      return testProducts;
    } catch (e) {
      final testProducts = TestProducts.fromJson(testProductsResponse.data);
      return testProducts;
    }
  }
}
