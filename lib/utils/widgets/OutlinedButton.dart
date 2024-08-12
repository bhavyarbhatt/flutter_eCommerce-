import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;
  final Color textColor;

  OutlinedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.black,
    required this.horizontalPadding,
    required this.verticalPadding

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
        onPressed: onPressed,
        child: Text(
            text,
            style: TextStyle(
              color: textColor
            ),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ,
              vertical: verticalPadding
          ),
        ),
      );
  }
}
