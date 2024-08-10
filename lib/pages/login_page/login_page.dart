import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/main.dart';
import 'package:flutter_ecommerce/utils/widgets/dynamic_responsive.dart';
import 'package:flutter_ecommerce/utils/widgets/splashs_screen_responsive_ui.dart';
import 'package:get/get.dart';

import '../../controller/responsiveUIController/responsiveController.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveHomePage(mobileLayout: _loginScreen());
        }
  }

 Widget _loginScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Login Screen",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image at the top
            Image.asset(
              'assets/splash_screen.png', // Replace with your image asset
              height: 100,
            ),
            SizedBox(height: 30),

            // Email TextField
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Password TextField
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle submit logic
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
            ),
            SizedBox(height: 20),

            // Register Button
            OutlinedButton(
              onPressed: () {
                // Handle register logic (e.g., navigate to the registration screen)
              },
              child: Text('Register'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
            ),
            SizedBox(height: 20),

            // Skip Button
            TextButton(
              onPressed: () {
                // Handle skip logic (e.g., navigate to the next screen)
              },
              child: Text(
                'Skip for Demo',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );

 }