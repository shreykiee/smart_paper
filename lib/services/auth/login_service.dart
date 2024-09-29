// lib/services/auth/login_service.dart

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'https://formally-thorough-possum.ngrok-free.app/user/login', // Update with your actual login endpoint
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (kDebugMode) {
        print(response);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is Map<String, dynamic>) {
          return response.data;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error in login service: $error');
      }
      throw error; // Rethrow to handle in the calling method
    }
  }
}
