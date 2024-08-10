import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/responsiveUIController/responsiveController.dart';

// Dynamic Responsive View
class ResponsiveHomePage extends StatelessWidget {

  final Widget mobileLayout;

  const ResponsiveHomePage({super.key, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    var screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 600;

    return isMobile ? buildMobileLayout() : buildWebLayout(context);
  }

  Widget buildMobileLayout() {
    return mobileLayout;
  }

  Widget buildWebLayout(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
       body: Center(
         child: Card(
           elevation: 5,
           child: Container(
             width: screenWidth * 0.3,
             decoration: BoxDecoration(
             border: Border.all(
                   color: Colors.black,  // Set the color of the border
                   width: 1,  // Set the width of the border
             ),
             ),
           child: buildMobileLayout(),
           ),
         ),
       ),
    );
  }
}
