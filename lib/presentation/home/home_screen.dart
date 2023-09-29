import 'package:base_getx/presentation/home/home_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/app.dart';
import '../../data/local_data/app_prefs.dart';
import '../presentation.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Gap(32),
                // InkWell(
                //   // onTap: () => context.pop(true),
                //   child: Icon(
                //     Icons.arrow_back_ios,
                //     size: 30.w,
                //     color: Theme.of(context).primaryColorDark,
                //   ),
                // ),
                const Gap(32),
                Row(
                  children: [
                    Text(
                      'THEME : ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    StreamBuilder(
                      stream: AppPrefs().watch('isLightMode'),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        bool isLightMode = AppPrefs.isLightMode;
                        return Text(
                          !isLightMode ? 'DARK MODE' : 'LIGHT MODE',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: ColorManager.primary),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringManager.meow,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const Gap(20),
                      Row(
                        children: TranslationService.appSupportedLocales
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: WidgetButton(
                                    onTap: () {
                                      Get.updateLocale(e);
                                    },
                                    borderRadius: BorderRadius.circular(8),
                                    child: Text(e.languageCode,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                  ),
                                ))
                            .toList(),
                      ),
                      const Gap(20),
                      TextButton(
                          onPressed: () {
                            Get.to(Homee2())!
                                .then((value) => print("VALuEEE $value"));
                          },
                          child: Text('TO HOME2'))
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                StreamBuilder(
                  stream: AppPrefs.box.watch(key: 'isLightMode'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    bool isLightMode = AppPrefs.isLightMode;
                    print("isLightMode ${isLightMode}");
                    return FlutterSwitch(
                      width: 125.0,
                      height: 55.0,
                      valueFontSize: 25.0,
                      toggleSize: 45.0,
                      value: isLightMode,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      activeText: "Dark",
                      inactiveText: "Light",
                      onToggle: (val) {
                        print("VALUEEEE $val");
                        if (val == true) {
                          AppPrefs.isLightMode = true;
                          Get.changeTheme(ThemeManager.getLightModeTheme());
                        } else {
                          AppPrefs.isLightMode = false;
                          Get.changeTheme(ThemeManager.getDarkModeTheme());
                        }
                        // AppPrefs.isDarkMode = !AppPrefs.isDarkMode;
                        // if (AppPrefs.isDarkMode) {
                        //   // AppPrefs.isDarkMode = true;
                        //   print(AppPrefs.isDarkMode);
                        //   Get.changeTheme(ThemeManager.getDarkModeTheme());
                        // } else {
                        //   // AppPrefs.isDarkMode = false;

                        //   print(AppPrefs.isDarkMode);
                        //   Get.changeTheme(ThemeManager.getLightModeTheme());
                        // }
                      },
                    );
                  },
                ),
                const Gap(32),
              ],
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}

class Homee2 extends StatelessWidget {
  const Homee2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.to(Homee3())!.then((value) {
                if (value != null && value == true) {
                  Get.back(result: true);
                }
              });
            },
            child: Text('TO HOME 3')),
      ),
    );
  }
}

class Homee3 extends StatelessWidget {
  const Homee3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text('BACK TO HOME')),
      ),
    );
  }
}
