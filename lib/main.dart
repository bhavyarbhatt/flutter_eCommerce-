import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controller/myController.dart';
import 'package:flutter_ecommerce/controller/responsiveUIController/responsiveController.dart';
import 'package:flutter_ecommerce/pages/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: ResponsiveView()
    );
  }
}

class ResponsiveView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GetBuilder<ResponsiveController>(
        init: ResponsiveController(),
        builder: (controller) {
          controller.updateScreenSize(MediaQuery.of(context).size);

          Size screenSize =  controller.screenSize.value;

          if(screenSize.width >= 800) {
            return _buildWebLayout();
          } else {
            return _buildMobileLayout();
          }

        },
      ),
    );
  }

  // Web View
  Widget _buildWebLayout() {
    return Center(
      child: _buildMobileLayout(),
    );
  }

  // Mobile View
  Widget _buildMobileLayout() {
    return SplashScreen();
  }
}