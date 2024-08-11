import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/splash_screen/splash_screen.dart';
import 'package:flutter_ecommerce/utils/widgets/splashs_screen_responsive_ui.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: ResponsiveView(mobileLayout: _splashScreen(),)
    );
  }

  Widget _splashScreen() {
    return SplashScreen();
  }
}
