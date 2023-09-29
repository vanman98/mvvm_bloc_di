

import '../network/base_response.dart';

abstract class Api {
  Future<BaseResponse> login(String email,String password);
}
