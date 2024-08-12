import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final Color textColor;

  ElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    required this.horizontalPadding,
    required this.verticalPadding

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, // Adjust horizontal padding
          vertical: verticalPadding,    // Adjust vertical padding
        ),
        backgroundColor: backgroundColor, // Button background color
      ),
    );
  }
}
