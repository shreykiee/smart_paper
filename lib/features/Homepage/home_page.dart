import 'package:flutter/material.dart';

import 'package:smart_paper/features/login-register/services/token_storage_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TokenStorageService _tokenStorageService = TokenStorageService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String? token = _tokenStorageService.getToken();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Stored JWT Token: $token'),
            ));
          },
          child: const Text('Show Stored Token'),
        ),
      ),
    );
  }
}
