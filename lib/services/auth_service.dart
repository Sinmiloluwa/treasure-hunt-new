import 'package:treasure_hunt/services/api_service.dart';

class AuthService {
  Future<void> signIn(String username, String password) async {
    final response = await ApiService.post(
      '/auth/login',
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      print('successful signin');
      return;
    } else {
      throw Exception('Invalid credentials: \\n${response.body}');
    }
  }
}
