import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    required this.hintText,
    super.key,
    required this.controller,
    this.isConfidential = false,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isConfidential;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // Added the controller to the TextFormField
      obscureText: isConfidential,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(), // Added a border for better UI
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hintText is missing";
        }
        return null; // Return null for valid input
      },
    );
  }
}
