import 'package:dio/dio.dart';
import 'package:ex_02/response/user_response.dart';

class UserService {
  final Dio _dio = Dio();

  Future<UserResponse> loginUser(String username, String password) async {
    try {
      final response = await _dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': 'kminchelle', // kminchelle
          'password': '0lelplR', // 0lelplR
        },
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unexpected error occurred');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
