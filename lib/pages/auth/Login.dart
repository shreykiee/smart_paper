// lib/pages/login_page.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/app_pallet.dart';
import 'package:smart_paper/pages/homepage/home_page.dart';
import 'package:smart_paper/services/auth/login_service.dart';
import 'package:smart_paper/services/auth/token_storage_service.dart';
import 'package:smart_paper/widgits/auth/auth_field.dart';
import 'package:smart_paper/widgits/auth/auth_gradient_button.dart';
import 'package:smart_paper/widgits/auth/pass_field.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final LoginService _loginService = LoginService();
  final TokenStorageService _tokenStorageService = TokenStorageService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (kDebugMode) {
        print('Logging in with: $email, $password');
      }

      try {
        // Call the login service and get the response data
        final response =
            await _loginService.login(email: email, password: password);

        if (response != null) {
          // Extract the JWT token and message from the response
          final jwttoken = response['token'];
          final message = response['message'];

          // Print the JWT token for debugging
          if (kDebugMode) {
            print('JWT Token: $jwttoken');
          }

          // Store the JWT token securely using Hive
          await _tokenStorageService.saveToken(jwttoken);

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: AppPallete.whiteColor,
          ));

          // Navigate to the home page or another appropriate page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const HomePage()), // Ensure you have a HomePage
          );
        } else {
          // Handle unexpected null response
          if (kDebugMode) {
            print('Login failed: No response from server.');
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login failed. Please try again.'),
            backgroundColor: AppPallete.errorColor,
          ));
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error logging in: $e');
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: AppPallete.errorColor,
        ));
      }
    } else {
      if (kDebugMode) {
        print('Form validation failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log In.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              AuthField(
                hintText: 'E-mail',
                controller: emailController,
              ),
              const SizedBox(height: 15),
              PasswordField(
                hintText: "Password",
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                isSignup: false,
                ButtonText: "Log In",
                onPressed: login, // Log in on button press
              ),
            ],
          ),
        ),
      ),
    );
  }
}
