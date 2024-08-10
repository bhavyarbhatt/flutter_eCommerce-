import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controller/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override

  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final SplashScreenController splashScreenController = Get.put(SplashScreenController());

    return  Scaffold(
        backgroundColor: Colors.white,
      body: GetBuilder<SplashScreenController>(
        builder: (splash_screen_controller){
          return  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(height: screenHeight * 0.2,),
                Text(""),
                Image.asset(
                  "assets/splash_screen.png",
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.3,
                ),

                Text(""),
                Text(
                  'E Commerce App',
                  style: TextStyle(
                      fontSize: screenWidth * 0.02,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}