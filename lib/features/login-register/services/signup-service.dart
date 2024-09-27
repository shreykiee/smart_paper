// SignupService class
import 'package:dio/dio.dart';

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
      print(response);
      // Return the response data as a Map
      return response.data as Map<String, dynamic>;
    } catch (error) {
      print('Error in signup service: $error');
      throw error; // Rethrow error if needed for error handling
    }
  }
}
