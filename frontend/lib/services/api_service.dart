import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/constants.dart';

class ApiService {
  static Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['token'];
        print("✅ Token reçu : $token");
        return null;
      } else {
        return jsonDecode(response.body)['msg'];
      }
    } catch (e) {
      return "Erreur de connexion au serveur";
    }
  }
}
