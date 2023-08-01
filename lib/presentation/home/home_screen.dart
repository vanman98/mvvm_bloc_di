import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:temp_package_name/app/base_widget/base_widget.dart';
import '../../app/app.dart';
import '../presentation.dart';

class HomeScreen extends StatefulWidget {
  final String? name;
  const HomeScreen({this.name, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = findInstance<HomeBloc>();
  @override
  void initState() {
    super.initState();
    controller.add(const InitEventHome());
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const Gap(32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(32),
              InkWell(
                onTap: () => context.pop(true),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30.w,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              const Gap(20),
              Text(
                AppThemeProvider.isDarkMode()
                    ? 'DEMO isDarkMode'
                    : 'DEMO isNotDarkMode',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Gap(16),
              Row(
                children: [
                  Text(
                    'NAME : ',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    widget.name ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: ColorManager.primary),
                  )
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
                    BlocConsumer<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          current is ColorTextState,
                      bloc: findInstance<HomeBloc>(),
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Text(
                          StringManager.meow,
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
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding:
          //       EdgeInsets.symmetric(horizontal: 16.w).copyWith(bottom: 200),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: WidgetButton(
          //           onTap: () async {
          //             setLoading(true);
          //           },
          //           borderRadius: BorderRadius.circular(12),
          //           child: Center(
          //             child: Text(
          //               'LOADING',
          //               style: TextStyle(color: Theme.of(context).primaryColor),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Gap(40.w),
          //       Expanded(
          //         child: WidgetButton(
          //           onTap: () async {
          //             showDialog(
          //                 context: context,
          //                 builder: (_) => DialogTwoButton(
          //                       title: 'Bạn muốn dừng loading?',
          //                       titleButtonConfirm: 'Xác nhận',
          //                       onTapConfirm: () {
          //                         setLoading(false);
          //                         context.pop();
          //                       },
          //                     ));
          //           },
          //           borderRadius: BorderRadius.circular(12),
          //           child: Center(
          //             child: Text(
          //               'STOP LOADING',
          //               style: TextStyle(color: Theme.of(context).primaryColor),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
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
    ));
  }
}
