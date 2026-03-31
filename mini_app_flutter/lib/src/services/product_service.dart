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

  Future<List<Product>> getProductByCategory(
    String categoryId, {
    int page = 1,
    int pageSize = 12,
    String sort = 'newest',
  }) async {
    try {
      final response = await _apiClient.dio.get(
        "/products/category/$categoryId",
        queryParameters: {'page': page, 'pageSize': pageSize, 'sort': sort},
      );
      if (response.statusCode == 200) {
        dynamic responseData = response.data;
        List<dynamic> listData = [];
        if (responseData is List) {
          listData = responseData;
        } else if (responseData is Map && responseData['items'] != null) {
          listData = responseData['items'];
        } else if (responseData is Map && responseData['data'] != null) {
          listData = responseData['data'];
        }
        return listData.map((json) => Product.fromJson(json)).toList();
      } else {
        return [];
      }
    } on DioException catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
