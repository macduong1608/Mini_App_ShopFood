import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'api_client.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();
  final storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _apiClient.dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        await storage.write(
          key: 'accessToken',
          value: response.data['accessToken'],
        );
        await storage.write(
          key: 'refreshToken',
          value: response.data['refreshToken'],
        );
        await storage.write(key: 'fullName', value: response.data['fullName']);
        return {'success': true, 'message': 'Login Successful'};
      }
      return {'success': false, 'message': 'Login Failed'};
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['detail'] ?? "Something went wrong";
      return {'success': false, 'message': errorMessage};
    }
  }

  Future<bool> isLoggedIn() async {
    String? token = await storage.read(key: 'accessToken');
    return token != null;
  }

  Future<void> logout() async {
    await storage.deleteAll();
  }
}
