import 'package:ex_02/response/product_response.dart';
import 'package:ex_02/service/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductService _productService = ProductService();
  final productResponse = ProductResponse().obs;

  void getAllProducts() async {
    try {
      final response = await _productService.fetchAllProduct(10);
      productResponse.value = response;
    } catch (e) {
      // TODO :: Handle the error
      e.printInfo();
      print('Failed to get all: $e');
    }
  }
}
