import 'package:intl/intl.dart';
class AppUtils {
  AppUtils._();
  static DateTime? convertStringToDateTime({required String dateTimeStr,String? format}) {
    DateTime dateTime = DateFormat(format??'dd/MM/yyyy').parse(dateTimeStr);
    return dateTime;
  }
  static String convertDateTimeToString({required DateTime dateTime,String? format}) {
    String strDateTime = DateFormat(format??'dd/MM/yyyy').format(dateTime);
    return strDateTime;
  }
}
