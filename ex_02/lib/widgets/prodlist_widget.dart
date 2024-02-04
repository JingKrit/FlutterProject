import 'package:cached_network_image/cached_network_image.dart';
import 'package:ex_02/controllers/product_controller.dart';
import 'package:ex_02/response/product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListingWidget extends StatefulWidget {
  const ProductListingWidget({Key? key}) : super(key: key);

  @override
  State<ProductListingWidget> createState() => _ProductListingWidgetState();
}

class _ProductListingWidgetState extends State<ProductListingWidget> {
  ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    productController.getAllProducts();
  }

  List<Products> searchedProducts = [];
  bool isSearchStarted = false;

  void searchProducts(String query) {
    // searchedProducts = products
    //     .where((product) =>
    //         product.name.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    // setState(() {
    //   isSearchStarted = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                searchProducts(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(child: Obx(() {
            List<Products> products =
                productController.productResponse.value.products!;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                childAspectRatio:
                    MediaQuery.of(context).size.width > 600 ? 0.8 : 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return createItem(products[index]);
              },
            );
          })),
        ],
      ),
    );
  }

  Widget createItem(Products products) {
    return Card(
      child: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(5)),
          CachedNetworkImage(
            imageUrl: products.thumbnail!,
            width: 150,
            height: 110,
            fit: BoxFit.cover,
          ),
          Text(products.title!),
          // Text(product.description!),
          Text(products.price.toString()),
        ],
      ),
    );
  }
}
