import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/utils/widgets/dynamic_responsive.dart';


import '../../models/products.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return  ResponsiveHomePage(mobileLayout: _productDetailsPage(context, product));

  }

Widget _productDetailsPage(BuildContext context, Product product) {
  return Scaffold(
    appBar: AppBar(
      title: Text(product.title),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Category: ${product.category}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Rating: ${product.rating.rate.toString()}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '(${product.rating.count} reviews)',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    product.isFavorited ? Icons.favorite : Icons
                        .favorite_border,
                    color: product.isFavorited ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    // You would typically call a method here to toggle the favorite status
                    // productController.toggleFavorite(product.id); // Implement this in the controller
                  },
                ),
                Text(
                  'Add to Favorites',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),

  );
}




}