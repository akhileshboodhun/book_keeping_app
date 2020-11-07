import 'dart:convert';
import 'dart:io';

import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

String myUrl;

Future<List<Cashbook>> fetchCashbooks({int choice = 0}) async {
  myUrl = '${Constants.api}/Cashbooks'; //get all bookings
  if (choice == 1) myUrl += "/reserved";

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
    return parseCashbooks(responsebody);
  } else {
    return parseCashbooks('[]');
  }
}

Future<int> getTotalSales() async {
  myUrl = '${Constants.api}/Cashbooks/totalsales'; //get all bookings
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
    return int.parse(responsebody);
  } else {
    return null;
  }
}

Future<Cashbook> findCashbook(int id) async {
  myUrl = '${Constants.api}/Cashbooks/$id'; //get all bookings

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
    return Cashbook.fromJson(
        json.decode(responsebody).cast<Map<String, dynamic>>());
  } else
    return null;
}

List<Cashbook> parseCashbooks(String responsebody) {
  final parsed = json.decode(responsebody).cast<Map<String, dynamic>>();
  return parsed.map<Cashbook>((json) => Cashbook.fromJson(json)).toList();
}

Future<bool> postCashbook(Cashbook cb) async {
  myUrl = '${Constants.api}/Cashbooks'; //get all bookings

  // var prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString('token');
  // var header = 'Bearer $token';

  HttpClient httpClient = new HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  var request = await httpClient.postUrl(Uri.parse(myUrl));
  // request.headers.set('Authorization', header);
  request.headers.set('Content-type', 'application/json');
  // List<Map<String, dynamic>> myjsonarray = [];
  // for (Cashbook b in lcb) {
  //   myjsonarray.add(b.toJson());
  // }
  // var body = utf8.encode(json.encode(myjsonarray));
  // // request.contentLength = body.length;
  // print(json.encode(myjsonarray));
  var body = utf8.encode(json.encode(cb));
  // request.contentLength = body.length;
  request.write(json.encode(cb));

  final response = await request.close();
  if (response.statusCode == 201) {
    //status 201 means CREATED
    final responsebody = await response.transform(Utf8Decoder()).join();
    print(responsebody);
    return true;
  } else
    print(response.statusCode);
  final responsebody = await response.transform(Utf8Decoder()).join();
  print(responsebody);
  print(json.encode(body));
  print(request.connectionInfo);
  return false;
}

Future<bool> updateCashbook(int id, Cashbook cb) async {
  myUrl = '${Constants.api}/Cashbooks/$id'; //get all bookings

  // var prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString('token');
  // var header = 'Bearer $token';

  HttpClient httpClient = new HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  var request = await httpClient.putUrl(Uri.parse(myUrl));
  // request.headers.set('Authorization', header);
  request.headers.set('Content-type', 'application/json');
  // List<Map<String, dynamic>> myjsonarray = [];
  // for (Cashbook b in lcb) {
  //   myjsonarray.add(b.toJson());
  // }
  // var body = utf8.encode(json.encode(myjsonarray));
  // // request.contentLength = body.length;
  // print(json.encode(myjsonarray));
  var body = utf8.encode(json.encode(cb));
  // request.contentLength = body.length;
  request.write(json.encode(cb));

  final response = await request.close();
  if (response.statusCode == 204) {
    //status 201 means CREATED
    final responsebody = await response.transform(Utf8Decoder()).join();
    print(responsebody);
    return true;
  } else
    print(response.statusCode);
  final responsebody = await response.transform(Utf8Decoder()).join();
  print(responsebody);
  print(json.encode(body));
  print(request.connectionInfo);
  return false;
}

Future<bool> deleteCashbook(int id) async {
  myUrl = '${Constants.api}/Cashbooks/$id'; //get all bookings

  // var prefs = await SharedPreferences.getInstance();
  // String token = prefs.getString('token');
  // var header = 'Bearer $token';

  HttpClient httpClient = new HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;

  var request = await httpClient.deleteUrl(Uri.parse(myUrl));
  // request.headers.set('Authorization', header);
  request.headers.set('Content-type', 'application/json');

  final response = await request.close();
  if (response.statusCode == 204) {
    //status 201 means CREATED
    final responsebody = await response.transform(Utf8Decoder()).join();
    print(responsebody);
    return true;
  } else
    print(response.statusCode);
  final responsebody = await response.transform(Utf8Decoder()).join();
  print(responsebody);
  print(request.connectionInfo);
  return false;
}
