import 'package:coffee/domain/api/api_service.dart';
import 'package:coffee/domain/models/test_products.dart';

class ProductsRepository {
  Future<TestProducts> getAllProducts() => ApiService.getNowProducts();
}
