import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.hintText,
    super.key,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(), // Added a border for better UI
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          // Updated to handle null
          return "${widget.hintText} is missing";
        } else if (value.length < 6) {
          // Example: enforce a minimum length
          return "Password must be at least 6 characters";
        }
        return null; // Return null for valid input
      },
    );
  }
}
