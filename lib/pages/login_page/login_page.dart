import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/Payments/payment_page.dart';
import 'package:flutter_ecommerce/pages/dashboard/dashboard_screen.dart';
import 'package:flutter_ecommerce/pages/register_page/register_page.dart';
import 'package:flutter_ecommerce/utils/widgets/OutlinedButton.dart';
import 'package:flutter_ecommerce/utils/widgets/border.dart';
import 'package:flutter_ecommerce/utils/widgets/dynamic_responsive.dart';
import 'package:flutter_ecommerce/utils/widgets/elevatedButton.dart';
import 'package:flutter_ecommerce/utils/widgets/textFeild.dart';
import 'package:get/get.dart';

// Compliated

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool _isObscure = true; // Move _isObscure here to manage state

  @override
  Widget build(BuildContext context) {
    return ResponsiveHomePage(mobileLayout: _loginScreen(context));
  }

  Widget _loginScreen(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    //controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              16.0, // Adjust for AppBar height
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly space the widgets
              children: <Widget>[

                // Image at the top
                Image.asset(
                  'assets/splash_screen.png',
                  height: screenHeight * 0.2,
                ),

                CustomTextField(
                  controller: _emailController,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                ),

                CustomTextField(
                  controller: _passwordController,
                  labelText: 'Password',
                  isPassword: true,
                  prefixIcon: Icons.lock,
                ),

                // Submit Button
                ElevatedButtonWidget(
                    onPressed: (){
                      Get.to(PaymentPage());
                    },
                    horizontalPadding: screenHeight * 0.15,
                    verticalPadding: screenHeight * 0.01,
                    text: "Submit",
                ),

                OutlinedButtonWidget(
                    onPressed: () {
                      Get.off(RegisterScreen());
                    },
                    text: "Register",
                    horizontalPadding: screenHeight * 0.14,
                    verticalPadding: screenWidth * 0.01,
                ),

                // Skip Button
                TextButton(
                  onPressed: () {
                    Get.off(ProductListScreen());
                  },
                  child: Text(
                    'Skip for Demo',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

