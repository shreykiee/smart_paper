import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/app_pallet.dart';

class AuthGradientButton extends StatelessWidget {
  final String ButtonText;
  final bool isSignup; // Positional argument to check if it's signup
  final VoidCallback onPressed; // onPressed callback function

  const AuthGradientButton({
    super.key,
    required this.ButtonText,
    required this.isSignup, // Accepts the flag for signup or login
    required this.onPressed, // Callback for onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          AppPallete.gradient1,
          AppPallete.gradient2,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed, // Trigger the passed function
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(ButtonText,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
