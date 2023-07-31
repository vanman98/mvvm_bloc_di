import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../di.dart';
import 'loading_bloc/loading_bloc.dart';

class BaseWidget extends StatelessWidget {
  final Widget child;
  const BaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
        bloc: findInstance<LoadingBloc>(),
        builder: (context, LoadingState loading) => Stack(
              alignment: Alignment.center,
              children: [
                child,
                if (loading is IsLoading)
                  loading.isLoading == true
                      ? SpinKitFadingCube(
                          color: Colors.orange,
                          size: 50.0.w,
                        )
                      : const SizedBox()
              ],
            ));
  }
}
