import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required String baseUrl}) : dio = Dio() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);

    // Add interceptors for logging and error handling
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<Map<String, dynamic>> request({
    required String endpoint,
    String method = 'GET',
    Map<String, dynamic>? data,
  }) async {
    try {
      late Response response;

      switch (method.toUpperCase()) {
        case 'POST':
          response = await dio.post(endpoint, data: data);
          break;
        case 'PUT':
          response = await dio.put(endpoint, data: data);
          break;
        case 'DELETE':
          response = await dio.delete(endpoint);
          break;
        case 'GET':
        default:
          response = await dio.get(endpoint);
          break;
      }

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
