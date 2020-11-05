import 'dart:convert';
import 'dart:io';

import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

String myUrl;

Future<List<Cashbook>> fetchCashbooks(int choice) async {
  myUrl = '${Constants.api}/Cashbooks?choice=$choice'; //get all bookings

  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  var header = 'Bearer $token';

  HttpClient httpClient = new HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  var request = await httpClient.getUrl(Uri.parse(myUrl));
  request.headers.set('Authorization', header);
  request.headers.set('Content-type', 'application/json');

  final response = await request.close();
  if (response.statusCode == 200) {
    final responsebody = await response.transform(Utf8Decoder()).join();
    print(responsebody);
    return parseCashbooks(responsebody);
  } else
    return parseCashbooks('[]');
}

List<Cashbook> parseCashbooks(String responsebody) {
  final parsed = json.decode(responsebody).cast<Map<String, dynamic>>();
  return parsed.map<Cashbook>((json) => Cashbook.fromJson(json)).toList();
}

Future<bool> patchCashbook(List<Cashbook> lb, {String newDateTime}) async {
  myUrl = '${Constants.api}/Cashbooks'; //get all bookings

  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  var header = 'Bearer $token';

  HttpClient httpClient = new HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  var request = await httpClient.patchUrl(Uri.parse(myUrl));
  request.headers.set('Authorization', header);
  request.headers.set('Content-type', 'application/json');
  List<Map<String, dynamic>> myjsonarray = [];
  // for (Cashbook b in lb) {
  //   Map<String, dynamic> myjson = (newDateTime == null)
  //       ? {
  //           'status': b.status,
  //           'booking_id': b.booking_id,
  //           'Cashbook_date_time': b.date_time
  //         }
  //       : {
  //           'booking_id': b.booking_id,
  //           'Cashbook_date_time': b.date_time,
  //           'updated_date_time': newDateTime
  //         };
  //   myjsonarray.add(myjson);
  // }
  request.write(json.encode(myjsonarray));
  print(json.encode(myjsonarray));

  final response = await request.close();
  if (response.statusCode == 200) {
    final responsebody = await response.transform(Utf8Decoder()).join();
    print(responsebody);
    return true;
  } else
    print(response.statusCode);
  final responsebody = await response.transform(Utf8Decoder()).join();
  print(responsebody);
  print(json.encode(myjsonarray));
  print(request.connectionInfo);
  return false;
}
