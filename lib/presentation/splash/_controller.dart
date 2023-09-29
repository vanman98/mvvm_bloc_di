import 'package:base_getx/presentation/resource/resource.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(RouterManager.home);
    });
    super.onInit();
  }
}
