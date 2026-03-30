import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final Dio dio = Dio();
  final storage = const FlutterSecureStorage();
  final String baseUrl = "http://192.168.86.113:5001/api";

  ApiClient() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await storage.read(key: 'accessToken');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            String? refreshToken = await storage.read(key: 'refreshToken');
            if (refreshToken != null) {
              try {
                final response = await Dio().post(
                  '$baseUrl/auth/refresh',
                  data: {'refreshToken': refreshToken},
                );
                if (response.statusCode == 200) {
                  String newAccessToken = response.data['accessToken'];
                  await storage.write(
                    key: 'accessToken',
                    value: newAccessToken,
                  );
                  e.requestOptions.headers['Authorization'] =
                      'Bearer $newAccessToken';
                  final retryResponse = await dio.fetch(e.requestOptions);
                  return handler.resolve(retryResponse);
                }
              } catch (err) {
                await storage.deleteAll();
                print("Phiên đăng nhập hết hạn hoàn toàn, vui lòng login lại");
              }
            }
          }
          return handler.next(e);
        },
      ),
    );
  }
}
