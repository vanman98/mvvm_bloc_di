import 'package:temp_package_name/data/remote_data/network/base_response.dart';

abstract class Api {
  Future<BaseResponse> login(String email,String password);
}
