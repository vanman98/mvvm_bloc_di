import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:temp_package_name/presentation/widgets/widget_button.dart';

import '../../app/app.dart';
import '../presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const Gap(32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              Text(
                AppThemeProvider.isDarkMode()
                    ? 'DEMO isDarkMode'
                    : 'DEMO isNotDarkMode',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Gap(16),
              // WidgetButton(
              //   borderRadius: BorderRadius.circular(8),
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              //     child: Text(
              //       'Next page',
              //       style: Theme.of(context)
              //           .textTheme
              //           .labelLarge!
              //           .copyWith(color: Theme.of(context).primaryColor),
              //     ),
              //   ),
              // ),
              // const Gap(32),
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
                    BlocConsumer<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          current is ColorTextState,
                      bloc: findInstance<HomeBloc>(),
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Text(
                          'meow'.tr(),
                          style: Theme.of(context).textTheme.labelSmall,
                        );
                      },
                    ),
                    const Gap(20),
                    Row(
                      children: appSupportedLocales
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: WidgetButton(
                                  onTap: () {
                                    context.setLocale(e);
                                  },
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 32),
                                    child: Text(e.languageCode,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // StreamBuilder(
          //   stream: AppPrefs.instance.box.watch(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     UserModel user = AppPrefs.instance.box.get(0);
          //     return Container(
          //       child: Text(user.name),
          //     );
          //   },
          // ),
          // WidgetDeleteButton(
          //   callback: () {},
          // ),
          // Row(
          //   children: [
          //     WidgetRippleButton(
          //       color: Colors.red,
          //       child: Container(
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
          //         child: Text(
          //           'Change Text',
          //           style: w400TextStyle(color: appColorBackground),
          //         ),
          //       ),
          //       onTap: () => findInstance<HomeBloc>().add(ChangeColorText()),
          //     ),
          //     BlocConsumer<HomeBloc, HomeState>(
          //       bloc: findInstance<HomeBloc>(),
          //       listener: (context, state) {
          //         // TODO: implement listener
          //       },
          //       buildWhen: (previous, current) =>
          //           current is ColorBackgroundButton,
          //       builder: (context, state) {
          //         log("BUILDER BACKGROUND");
          //         return WidgetRippleButton(
          //           color: state is ColorBackgroundButton
          //               ? state.colorBackground
          //               : Colors.red,
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 10, horizontal: 32),
          //             child: Text(
          //               'Change Background',
          //               style: w400TextStyle(color: appColorBackground),
          //             ),
          //           ),
          //           onTap: () => findInstance<HomeBloc>()
          //               .add(ChangeColorBackgroundButton()),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          Row(
            children: [
              const Spacer(),
              FlutterSwitch(
                width: 125.0,
                height: 55.0,
                valueFontSize: 25.0,
                toggleSize: 45.0,
                value: AppThemeProvider.isDarkMode(context),
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                activeText: "Dark",
                inactiveText: "Light",
                onToggle: (val) {
                  findInstance<ThemeBloc>().add(ChangedThemeEvent(isDark: val));
                },
              ),
              const Gap(32),
            ],
          ),
          const Gap(32),
        ],
      ),
    );
  }
}
