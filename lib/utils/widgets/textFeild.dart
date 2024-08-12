import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? !_isObscure : false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(color: Colors.black), // Label color
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12), // Border color
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Border color when focused
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Colors.black) // Prefix icon color
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.black, // Suffix icon color
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure; // Toggle visibility
            });
          },
        )
            : null,
      ),
      style: TextStyle(color: Colors.black), // Text color
      cursorColor: Colors.black, // Cursor color
    );
  }
}
