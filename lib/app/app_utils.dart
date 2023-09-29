import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';

import '../presentation/widgets/widget_custom_toast.dart';

class AppUtils {
  AppUtils._();
  static DateTime? convertStringToDateTime(
      {required String dateTimeStr, String? format}) {
    DateTime dateTime = DateFormat(format ?? 'dd/MM/yyyy').parse(dateTimeStr);
    return dateTime;
  }

  static String convertDateTimeToString(
      {required DateTime dateTime, String? format}) {
    String strDateTime = DateFormat(format ?? 'dd/MM/yyyy').format(dateTime);
    return strDateTime;
  }

  static void toast(String? message,
      {Duration? duration,
      NotificationPosition? notificationPosition,
      CustomToastType type = CustomToastType.warning}) {
    if (message == null) return;
    showOverlayNotification(
      (context) {
        return CustomToast(
          message: message,
          type: type,
          content: Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
          ),
        );
      },
      position: notificationPosition ?? NotificationPosition.top,
      duration: duration ?? const Duration(milliseconds: 2000),
    );
  }
}
