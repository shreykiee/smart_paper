import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {required this.hintText,
      super.key,
      required this.controller,
      this.isconfidential = false});
  final String hintText;
  final TextEditingController controller;
  final bool isconfidential;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isconfidential,
      decoration: InputDecoration(hintText: hintText),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        }
        return "";
      },
    );
  }
}
