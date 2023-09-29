
import '../../data/remote_data/api/api_implements.dart';
import '../../data/remote_data/network/base_response.dart';

class AuthRepository {
  AuthRepository._();
  ApiImplements? _api;
  static AuthRepository? _instance;
  factory AuthRepository() {
    _instance ??= AuthRepository._();
    _instance!._api ??= ApiImplements();
    return _instance!;
  }
  Future<BaseResponse> login(String phone, String password) async {
    return await _api!.login(phone, password);
  }
}
