// SignupService class
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SignupService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> signup({
    required String email,
    required String password,
    required String mobileNumber,
  }) async {
    try {
      // Assuming this is the correct API endpoint and POST method
      final response = await _dio.post(
        'https://formally-thorough-possum.ngrok-free.app/user/register',
        data: {
          'email': email,
          'password': password,
          'mobileNo': mobileNumber,
        },
      );
      if (kDebugMode) {
        print(response);
      }
      // Return the response data as a Map
      return response.data as Map<String, dynamic>;
    } catch (error) {
      if (kDebugMode) {
        print('Error in signup service: $error');
      }
      rethrow; // Rethrow error if needed for error handling
    }
  }
}
