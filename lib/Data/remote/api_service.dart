import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final http.Client httpClient;

  ApiService({required this.baseUrl, required this.httpClient});

  Future<Map<String, dynamic>> request({
    required String endpoint,
    String method = 'GET',
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    late http.Response response;

    switch (method.toUpperCase()) {
      case 'POST':
        response = await httpClient.post(url, body: jsonEncode(body));
        break;
      case 'PUT':
        response = await httpClient.put(url, body: jsonEncode(body));
        break;
      case 'DELETE':
        response = await httpClient.delete(url);
        break;
      case 'GET':
      default:
        response = await httpClient.get(url);
        break;
    }

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
