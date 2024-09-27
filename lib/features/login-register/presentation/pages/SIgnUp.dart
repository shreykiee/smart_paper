import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smart_paper/core/theme/app_pallet.dart';

import 'package:smart_paper/features/Homepage/home_page.dart';
import 'package:smart_paper/features/login-register/presentation/widgits/auth_field.dart';
import 'package:smart_paper/features/login-register/presentation/widgits/auth_gradient_button.dart';
import 'package:smart_paper/features/login-register/presentation/widgits/pass_field.dart';
import 'package:smart_paper/features/login-register/services/signup-service.dart';
import 'package:smart_paper/features/login-register/services/token_storage_service.dart';

import 'Login.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final SignupService _signupService = SignupService();
  final TokenStorageService _tokenStorageService = TokenStorageService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    numberController.dispose();
    super.dispose();
  }

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final mobileNumber = numberController.text.trim();

      if (kDebugMode) {
        print('Signing up with: $email, $password, $mobileNumber');
      }

      try {
        // Call the signup service and get the response data
        final response = await _signupService.signup(
          email: email,
          password: password,
          mobileNumber: mobileNumber,
        );

        // Ensure the signup service returns the response data
        if (response != null) {
          // Extract the JWT token and message from the response
          final jwttoken = response['user']['jwttoken'];
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
            backgroundColor: Colors.green,
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
            print('Signup failed: No response from server.');
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Signup failed. Please try again.'),
            backgroundColor: Colors.red,
          ));
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error signing up: $e');
        }
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Signup failed. Please try again.'),
          backgroundColor: Colors.red,
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
                'Sign Up.',
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
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Mobile number',
                controller: numberController,
              ),
              const SizedBox(height: 20),
              AuthGradientButton(
                isSignup: true,
                ButtonText: "Sign Up",
                onPressed: signup, // Sign up on button press
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: AppPallete.gradient2),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
