import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:temp_package_name/app/app.dart';
import 'package:temp_package_name/data/data.dart';

class AppClients extends DioForNative {
  static const String GET = "GET";
  static const String POST = "POST";
  static const String PUT = "PUT";
  static const String DELETE = "DELETE";

  static AppClients? _instance;

  factory AppClients(
      {String baseUrl = AppEndpoint.BASE_URL, BaseOptions? options}) {
    _instance ??= AppClients._(baseUrl: baseUrl, options: options);
    if (options != null) _instance!.options = options;
    _instance!.options.baseUrl = baseUrl;
    return _instance!;
  }

  AppClients._({String baseUrl = AppEndpoint.BASE_URL, BaseOptions? options})
      : super(options) {
    interceptors.add(InterceptorsWrapper(
      onRequest: _requestInterceptor,
      onResponse: _responseInterceptor,
      onError: _errorInterceptor,
    ));

    this.options.baseUrl = baseUrl;
  }

  _requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String accessToken = AppPrefs.accessToken ?? '';
    options.headers.addAll({'Authorization': 'Bearer $accessToken'});

    log("Headers: ${options.headers}");

    switch (options.method) {
      case AppClients.GET:
        log("${options.method}: ${options.uri}\nParams: ${options.queryParameters}");
        break;
      case AppClients.POST:
        if (options.data is Map) {
          log("${options.method}: ${options.uri}\nParams: ${options.data}");
        } else if (options.data is FormData) {
          log("${options.method}: ${options.uri}\nParams: ${options.data.fields}");
        }
        break;
      default:
        break;
    }
    options.connectTimeout = const Duration(minutes: AppEndpoint.connectTimeout);
    options.receiveTimeout = const Duration(minutes: AppEndpoint.receiveTimeout);
    handler.next(options);
  }

  _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    log("Response ${response.requestOptions.uri}: ${response.statusCode}\nData: ${response.data}");
    handler.next(response);
  }

  _errorInterceptor(DioException dioError, ErrorInterceptorHandler handler) {
    log("${dioError.type} - Error ${dioError.message}\nURL: ${dioError.response?.requestOptions.uri}\nData: ${dioError.response?.data ?? ''}");
    handler.next(dioError);
  }
}
