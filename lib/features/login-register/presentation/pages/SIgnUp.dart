import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/app_pallet.dart';
import 'package:smart_paper/features/login-register/presentation/pages/Login.dart';
import 'package:smart_paper/features/login-register/presentation/widgits/auth_field.dart';
import 'package:smart_paper/features/login-register/presentation/widgits/auth_gradient_button.dart';
import 'package:smart_paper/features/login-register/presentation/widgits/pass_field.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
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
                  hintText: "Password", controller: passwordController),
              const SizedBox(height: 15),
              AuthField(
                hintText: 'Username',
                controller: nameController,
              ),
              const SizedBox(height: 20),
              const AuthGradientButton(
                ButtonText: "Sign Up",
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
