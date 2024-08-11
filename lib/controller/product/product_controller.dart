import 'package:http/http.dart' as http;
import 'package:flutter_ecommerce/models/products.dart';
import 'package:get/get.dart';
import 'dart:convert';

class ProductController extends GetxController {
  var products  = <Product>[];
  var isLoading = true;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try{
      isLoading=true;
      update();

      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if(response.statusCode == 200){
        var jsonData = json.decode(response.body) as List;
        products = jsonData.map((json) => Product.fromJson(json)).toList();
      }else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch(e)  {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading=false;
      update();
    }
  }

  void toggleFavorite(int productId) {
    var product = products.firstWhere((product) => product.id == productId);
    product.isFavorited = !product.isFavorited;
    refresh(); // This will update the UI
  }


}