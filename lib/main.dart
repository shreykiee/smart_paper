import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/theme.dart';
import 'package:smart_paper/features/login-register/presentation/pages/SIgnUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: const SignupPage(),
    );
  }
}
