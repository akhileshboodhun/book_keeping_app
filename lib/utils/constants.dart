import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class Constants {
  //static String api = 'https://192.168.8.130:45455/api';
  static String api = 'https://taxiplannerapi.azurewebsites.net/api';
  static List<String> approvalStatus = ['Pending', 'Approved', 'Rejected'];
  static List<Color> approvalColours = [Colors.grey, Colors.green, Colors.red];
  static List<IconData> approvalIcons = [
    LineAwesomeIcons.question_circle,
    LineAwesomeIcons.check_circle,
    LineAwesomeIcons.ban
  ];
  static int timeBeforeNotiff = 15;
}
