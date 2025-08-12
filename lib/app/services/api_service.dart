import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = _createDio();
  }

  Dio _createDio() {
    final dio = Dio();


    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseType: ResponseType.json,
    );


    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        error: true,
        logPrint: (object) {
          log('🌐 API: $object');
        },
      ),
    );


    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('🚀 Making ${options.method} request to: ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          log('✅ Response received with status: ${response.statusCode}');
          handler.next(response);
        },
        onError: (error, handler) {
          log('❌ API Error: ${error.message}');
          if (error.response != null) {
            log('Error response data: ${error.response?.data}');
            log('Error status code: ${error.response?.statusCode}');
          }
          handler.next(error);
        },
      ),
    );

    return dio;
  }

  /// Get method for API calls
  Future<Response<T>> get<T>(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  // /// Post method for API calls
  // Future<Response<T>> post<T>(
  //     String path, {
  //       dynamic data,
  //       Map<String, dynamic>? queryParameters,
  //       Options? options,
  //       CancelToken? cancelToken,
  //     }) async {
  //   try {
  //     final response = await _dio.post<T>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     throw _handleDioError(e);
  //   }
  // }
  //
  // /// Put method for API calls
  // Future<Response<T>> put<T>(
  //     String path, {
  //       dynamic data,
  //       Map<String, dynamic>? queryParameters,
  //       Options? options,
  //       CancelToken? cancelToken,
  //     }) async {
  //   try {
  //     final response = await _dio.put<T>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     throw _handleDioError(e);
  //   }
  // }
  //
  // /// Delete method for API calls
  // Future<Response<T>> delete<T>(
  //     String path, {
  //       dynamic data,
  //       Map<String, dynamic>? queryParameters,
  //       Options? options,
  //       CancelToken? cancelToken,
  //     }) async {
  //   try {
  //     final response = await _dio.delete<T>(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     throw _handleDioError(e);
  //   }
  // }

  /// Handle Dio errors and convert them to more meaningful exceptions
  Exception _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timeout. Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        return Exception('Request timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return Exception('Response timeout. The server is taking too long to respond.');
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?.toString() ?? 'Unknown error occurred';
        return Exception('Server error ($statusCode): $message');
      case DioExceptionType.cancel:
        return Exception('Request was cancelled');
      case DioExceptionType.connectionError:
        return Exception('Connection error. Please check your internet connection.');
      case DioExceptionType.badCertificate:
        return Exception('Certificate error. Unable to verify server certificate.');
      case DioExceptionType.unknown:
      default:
        return Exception('An unexpected error occurred: ${error.message}');
    }
  }

  /// Get raw response as string (useful for debugging)
  Future<Response<String>> getRawResponse(String path) async {
    try {
      final response = await _dio.get<String>(
        path,
        options: Options(responseType: ResponseType.plain),
      );
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  /// Dispose method to clean up resources
  void dispose() {
    _dio.close();
  }
}