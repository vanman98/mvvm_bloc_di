import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/app/app_validate.dart';
import 'package:temp_package_name/app/base_widget/base_widget.dart';
import 'package:temp_package_name/app/di.dart';
import 'package:temp_package_name/presentation/login/bloc/login_bloc.dart';
import 'package:temp_package_name/presentation/presentation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String text = 'Đăng nhập';
  final bloc = findInstance<LoginBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: bloc.keyValidate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(32),
              InkWell(
                onTap: () => context.pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('LOGIN', style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
              const Gap(30),
              WidgetTextField(
                validator: AppValidate.validatePhoneNumber(),
                controller: bloc.phoneController,
                labelStyle: const TextStyle(color: Colors.black),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                labelText: 'Số điện thoại ',
                textInputType: TextInputType.number,
                hintText: 'Nhập số điện thoại',
              ),
              const Gap(20),
              WidgetTextField(
                controller: bloc.passwordController,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                hintText: 'Nhập mật khẩu',
                labelText: 'Mật khẩu',
                showEyeSuffix: true,
                validator: AppValidate.validatePassword(),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetButton(
                    onTap: () async {
                      bloc.login();
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: Text(
                        text,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
