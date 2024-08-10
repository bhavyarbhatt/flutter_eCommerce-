import 'package:flutter_ecommerce/pages/login_page/login_page.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1));

    Get.off(() => LoginScreen());
  }
}