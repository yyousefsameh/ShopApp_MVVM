import 'package:dio/dio.dart';

class ApiService {
  // final _baseUrl = 'https://student.valuxapps.com/api/';

  // ApiService(this._dio);
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ),
  );

  Future<Response> getData({
    required String endPoint,
    String? token,
    String language = 'en',
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      'lang': language,
      'Authorization': token,
    };
    Response response = await _dio.get(endPoint);
    return response;
  }

  Future<Response> postUserData({
    required String endPoint,
    required Map<String, dynamic> data,
    String language = 'en',
    String? token,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      'lang': language,
    };
    Response response = await _dio.post(
      endPoint,
      data: data,
    );
    return response;
  }

  Future<Response> updateUserData({
    required String endPoint,
    required Map<String, dynamic> data,
    String language = 'en',
    String? token,
  }) async {
    _dio.options.headers = {
      "Content-Type": "application/json",
      'lang': language,
    };
    Response response = await _dio.put(
      endPoint,
      data: data,
    );
    return response;
  }

  Future<Response> addOrDeleteFromFavorites({
    required int productId,
    required Map<String, dynamic> data,
    required String endPoint,
    required String token,
  }) async {
    Response response = await _dio.post(
      endPoint,
      data: data,
    );
    return response;
  }
}
