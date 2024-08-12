import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controller/product/product_controller.dart';
import 'package:flutter_ecommerce/pages/product_page/product_details_page.dart';
import 'package:flutter_ecommerce/utils/widgets/dynamic_responsive.dart';
import 'package:get/get.dart';


class ProductListScreen extends StatelessWidget{
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context){
    return ResponsiveHomePage(mobileLayout: _product(context));
  }

  Widget _product(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

     return Scaffold(
       appBar: AppBar(
         title: Text("Dashboard"),
       ),
       body: GetBuilder<ProductController>(
         init: ProductController(),
         builder: (productController){
           if(productController.isLoading){
             return Center(
               child: CircularProgressIndicator(),
             );
           }

           return GridView.builder(
               padding: EdgeInsets.all(8.0),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 8.0,
                 mainAxisSpacing: 8.0,
                 childAspectRatio: 0.75
               ),
                 itemCount: productController.products.length,
                 itemBuilder: (context, index){
                 final product = productController.products[index];
                 return _ProductCard(context, product);
              },
           );

         },

       ),
     );
  }

  Widget _ProductCard(BuildContext context,product) {

    // final ProductController productController = Get.find<ProductController>();

    return GestureDetector(
      onTap: (){
        Get.to(() => ProductDetailsPage(product: product) );
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.fill,
                    height: 120.0,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8.0,
                  left: 8.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    color: Colors.amber,
                    child: Text(
                      product.category,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child:IconButton(
                    icon: Icon(
                      product.isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: product.isFavorited ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      productController.toggleFavorite(product.id);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    product.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


// Widget _ProductCard(BuildContext context, product) {
  //
  //   return Card(
  //     elevation: 2.0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8.0),
  //     ),
  //     child: Column(
  //       children: [
  //         Stack(
  //           children: [
  //             ClipRRect(
  //               borderRadius: BorderRadius.vertical(
  //                 top: Radius.circular(8.0),
  //               ),
  //               child: Image.network(
  //                  product.image,
  //                 fit: BoxFit.fitHeight,
  //                 height: 120.00,
  //                 width: double.infinity,
  //               ),
  //             ),
  //
  //             Positioned(
  //               top: 8.0,
  //                 left: 8.0,
  //                 child: Container(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 8.0,
  //                     vertical:  4.0
  //                   ),
  //                   color: Colors.amber,
  //                   child: Text(
  //                     product.category,
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 12.0
  //                     ),
  //                   ),
  //                 ),
  //             ),
  //             Positioned(
  //                   bottom: 8.0,
  //                   right: 8.0,
  //                   child: Icon(
  //                     Icons.favorite_border,
  //                     color: Colors.grey,
  //                   ),
  //             ),
  //             Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       '\$${product.price.toStringAsFixed(0)}',
  //                       style: TextStyle(
  //                         color: Colors.purple,
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 12.0
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 8.0,
  //                     ),
  //                     Text(
  //                       product.title,
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w500,
  //                         fontSize: 14.0,
  //                         overflow: TextOverflow.ellipsis,
  //                       ),
  //                       maxLines: 2,
  //                     )
  //                   ],
  //                 ),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

}