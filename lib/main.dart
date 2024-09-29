import 'package:flutter/material.dart';
import 'package:smart_paper/core/theme/theme.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_paper/features/login-register/presentation/pages/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open a box
  await Hive.initFlutter();
  await Hive.openBox('authBox'); // You can name the box as you prefer

  runApp(MyApp());
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
