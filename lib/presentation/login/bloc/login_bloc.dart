import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/app/base_widget/loading_bloc/loading_bloc.dart';
import 'package:temp_package_name/data/data.dart';
import 'package:temp_package_name/domain/repository/auth_repository.dart';
import 'package:temp_package_name/presentation/presentation.dart';
import 'package:temp_package_name/presentation/widgets/widget_custom_toast.dart';

import '../../../app/app_utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  GlobalKey<FormState> keyValidate = GlobalKey();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  login() async {
    if (keyValidate.currentState!.validate()) {
      setLoading(true);
      final BaseResponse response = await AuthRepository()
          .login(phoneController.text, passwordController.text);
      if (response.isSuccess) {
        setLoading(false);
        AppUtils.toast('Đăng nhập thành công', type: CustomToastType.success);
        navigatorKey.currentContext!
            .pushNamed(RouterManager.home, queryParameters: {'name': 'Mẫn'});
      } else {
        setLoading(false);
        AppUtils.toast(response.message, type: CustomToastType.error);
      }
    }
  }
}
