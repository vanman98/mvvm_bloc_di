import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as Dio;
import 'package:easy_localization/easy_localization.dart';

const int _SUCCESS = 200;
const int _ERROR_TOKEN = 401;
const int _ERROR_VALIDATE = 422;
const int _ERROR_SERVER = 500;
const int _ERROR_DISCONNECT = -1;

class BaseResponse<T> {
  int? status;
  int? code;
  bool? success;
  String? message;
  T? data;

  bool get isSuccess => code == _SUCCESS && (success ?? false);

  bool get isError => code != _SUCCESS || (success ?? false);

  BaseResponse({this.success, this.message, this.data, this.code, this.status});

  factory BaseResponse.fromResponse(Dio.Response response, {Function(dynamic json)? dataConverter}) {
    try {
      return BaseResponse._fromJson(jsonDecode(jsonEncode(response.data)),
          dataConverter: dataConverter)
        ..code = response.statusCode;
    } catch (e) {
      log("Error BaseResponse.fromResponse: $e");
      return BaseResponse.withErrorConvertData(e);
    }
  }

  BaseResponse._fromJson(dynamic json, {Function(dynamic json)? dataConverter}) {
    status = json["status"];
    success = json["success"];
    message = json["message"];
    data = dataConverter != null && json["data"] != null
        ? dataConverter(json["data"])
        : json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["status"] = status;
    map["success"] = success;
    map["message"] = message;
    map["data"] = data;
    return map;
  }

  BaseResponse.withErrorRequest(Dio.DioException error) {
    try {
      Dio.Response? response = error.response;
      this.code = response?.statusCode ?? _ERROR_SERVER;
    } catch (e) {
      log("Error BaseResponse.withErrorRequest: $e");
    } finally {
      this.message = 'message_error_request'.tr();
      this.success = false;
      this.data = null;
    }
  }

  BaseResponse.withErrorConvertData(error) {
    this.message = 'message_error_convert'.tr();
    this.success = false;
    this.data = null;
  }

  BaseResponse.withNoInternetConnection() {
    this.message = 'message_disconnect'.tr();
    this.success = false;
    this.data = null;
  }
}
