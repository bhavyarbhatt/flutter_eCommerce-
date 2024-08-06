import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyResponsiveApp(),
    );
  }
}

class MyResponsiveApp extends StatefulWidget {
  @override
  State<MyResponsiveApp> createState() => _MyResponsiveAppState();
}

class _MyResponsiveAppState extends State<MyResponsiveApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout
            return MobileScreen();  
          } else {
            // Web layout
            return WebScreen();
          }
        },
      ),
    );
  }
}





class WebScreen extends StatefulWidget {
  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define the width and height of the container as a percentage of screen size
    final containerWidth = screenWidth * 0.25; // 80% of screen width
    final containerHeight = screenHeight * 1; // 80% of screen height

    return Scaffold(
      body: Center(
        child: Container(
          width: containerWidth,
          height: containerHeight,
          //  If required add border to web screen
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.black, // Border color
          //     width: 3, // Border width
          //   ),
          // ),
          child:  MobileScreen()
          ),
        ),
      );
  }
}


class MobileScreen extends StatefulWidget {
  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce App"),
      ),
      body: Center(
        
      ),
    );
  }
}