import 'dart:convert';
import 'dart:io';

import 'package:book_keeping_app/models/dashboard_model.dart';
import 'package:book_keeping_app/utils/constants.dart';

String myUrl;

Future<Dashboard> getDashboard() async {
  myUrl = '${Constants.api}/Cashbooks/dashboard'; //get all bookings
  // var prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString('token');
  // var header = 'Bearer $token';

  HttpClient httpClient = new HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  var request = await httpClient.getUrl(Uri.parse(myUrl));
  // request.headers.set('Authorization', header);
  // request.headers.set('Content-type', 'application/json');

  final response = await request.close();
  final responsebody = await response.transform(Utf8Decoder()).join();
  print(response.statusCode);
  // print(responsebody);
  print(request.connectionInfo.toString());
  if (response.statusCode == 200) {
    var x = "lol";
    return Dashboard.fromJson(json.decode(responsebody));
  } else {
    return null;
  }
}
