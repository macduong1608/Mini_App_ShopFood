import 'package:dio/dio.dart';
import 'package:mini_app_flutter/src/services/api_client.dart';

import '../model/product_model.dart';

class ProductService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Product>> getNewArrivals({int limit = 4}) async {
    try {
      final response = await _apiClient.dio.get(
        '/products/new-arrivals?limit=$limit',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      }
      return [];
    } on DioException catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getBestSellers({int limit = 4}) async {
    try {
      final response = await _apiClient.dio.get(
        '/products/best-sellers?limit=$limit',
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      }
      return [];
    } on DioException catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
