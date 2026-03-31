import 'package:dio/dio.dart';
import 'package:mini_app_flutter/src/model/category_model.dart';

import 'api_client.dart';

class CategoryService {
  final ApiClient _apiClient = ApiClient();

  Future<List<CategoryModel>> getCategoriesHome() async {
    try {
      final response = await _apiClient.dio.get("/categories/home");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => CategoryModel.fromJson(json)).toList();
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
