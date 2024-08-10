import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/responsiveUIController/responsiveController.dart';

// Splash Screen Responsive Layout
class ResponsiveView extends StatelessWidget {

  final Widget mobileLayout;

  const ResponsiveView({super.key, required this.mobileLayout});

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
    return mobileLayout;
  }
}