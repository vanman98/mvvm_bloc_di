import 'package:temp_package_name/data/data.dart';

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
