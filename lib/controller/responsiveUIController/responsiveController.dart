import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {

  var screenSize  = Size(0.0, 0.0).obs;

  void updateScreenSize(Size newSize) {
       screenSize.value = newSize;
       update();
  }

}