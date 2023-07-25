import 'package:dio/dio.dart';

import '../../data.dart';

class ApiImplements implements Api {
  ApiImplements._();
  static final ApiImplements _instance = ApiImplements._();
  factory ApiImplements() => _instance;
  @override
  Future<BaseResponse> login(String email, String password) async {
    bool isConnected = await CheckConnection.isConnected();
    if (!isConnected) return BaseResponse.withNoInternetConnection();
    try {
      Response response = await AppClients().post(AppEndpoint.LOGIN);
      return BaseResponse.fromResponse(response);
    } on DioException catch (e) {
      return BaseResponse.withErrorRequest(e);
    }
  }
}
