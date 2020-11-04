import 'package:intl/intl.dart';

class DateFormatter {
  //format accepted by Datetime parser = YYYYMMDD
  String format = 'EEE, d/MMM/yyyy';

  //incoming format = Day-Month-Year
  String formatter1(String original) {
    List<String> arr = original.split('-');
    String day, month;
    arr[0].length == 1 ? day = '0' + arr[0] : day = arr[0];
    arr[1].length == 1 ? month = '0' + arr[1] : month = arr[1];
    String temp = arr[2] + month + day;
    return new DateFormat('EEE, d/MM/yy').format(DateTime.parse(temp));
  }

  //incoming format = YYYY-MM-DD
  String formatter2(String original) {
    List<String> arr = original.split('-');
    String temp = arr[0] + arr[1] + arr[2];
    return new DateFormat('EEE, dd/MM/yy').format(DateTime.parse(temp));
  }
}
