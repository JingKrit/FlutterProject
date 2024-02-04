import 'package:dio/dio.dart';
import 'package:ex_02/response/product_response.dart';

class ProductService {
  Dio _dio = Dio();

  Future<ProductResponse> fetchAllProduct(int limit) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: "https://dummyjson.com",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      );
      _dio = Dio(options);
      final response = await _dio.get('/products?limit=$limit');

      if (response.statusCode == 200) {
        return ProductResponse.fromJson(response.data);
      } else if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unexpected error occurred');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
