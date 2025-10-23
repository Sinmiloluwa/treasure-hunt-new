import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:treasure_hunt/services/session_service.dart';

class ApiService {
  static const String baseUrl = 'https://treasure-hunt-backend-yfl1.onrender.com/api';

  static Future<Map<String, String>> _getHeaders(
      {bool includeAuth = true}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (includeAuth) {
      final token = await SessionService.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  static Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    final requestHeaders = await _getHeaders();

    if (headers != null) {
      requestHeaders.addAll(headers);
    }

    final uri = Uri.parse('$baseUrl$endpoint');

    return await http.get(uri, headers: requestHeaders);
  }

  static Future<http.Response> post(String endpoint,
      {Map<String, dynamic>? body}) async {
    final headers = await _getHeaders();
    final uri = Uri.parse('$baseUrl$endpoint');

    return await http.post(
      uri,
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
  }

  static Future<http.Response> put(String endpoint,
      {Map<String, dynamic>? body}) async {
    final headers = await _getHeaders();
    final uri = Uri.parse('$baseUrl$endpoint');

    return await http.put(
      uri,
      headers: headers,
      body: body != null ? json.encode(body) : null,
    );
  }

  static Future<http.Response> delete(String endpoint) async {
    final headers = await _getHeaders();
    final uri = Uri.parse('$baseUrl$endpoint');

    return await http.delete(uri, headers: headers);
  }

}