import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/app/base_widget/base_widget.dart';
import 'package:temp_package_name/presentation/presentation.dart';
import 'package:temp_package_name/presentation/widgets/widget_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String text = 'Đăng nhập';

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
              labelStyle: const TextStyle(color: Colors.black),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              labelText: 'Tài khoản ',
              hintText: 'Nhập tên tài khoản',
            ),
            const Gap(20),
            WidgetTextField(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              hintText: 'Nhập mật khẩu',
              labelText: 'Mật khẩu',
              showEyeSuffix: true,
            ),
            const Gap(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetButton(
                  onTap: () async {
                    context.pushNamed(RouterManager.home,
                        queryParameters: {'name': 'Mẫn'});
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
    ));
  }
}
