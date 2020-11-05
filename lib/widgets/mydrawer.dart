import 'package:book_keeping_app/views/bookkeeping.dart';
import 'package:book_keeping_app/views/dashboard.dart';
import 'package:book_keeping_app/views/home.dart';
import 'package:book_keeping_app/views/reservations.dart';
import 'package:book_keeping_app/views/viewdetails.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'FIH LOGO HERE',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(),
          _createDrawerItem(
              icon: LineAwesomeIcons.home,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.mybookings);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
              }),
          Divider(),
          _createDrawerItem(
              icon: LineAwesomeIcons.book,
              text: 'Cash Out Book',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.addbookings);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BookKeepingForm()));
              }),
          //Divider(),
          Divider(),
          _createDrawerItem(
              icon: LineAwesomeIcons.info,
              text: 'All Details',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.addbookings);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ViewDetails()));
              }),
          //Divider(),
          Divider(),
          _createDrawerItem(
              icon: LineAwesomeIcons.pie_chart,
              text: 'Dashboard',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.addbookings);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Dashboard(data: null)));
              }),
          //Divider(),
          Divider(),
          _createDrawerItem(
              icon: LineAwesomeIcons.calendar,
              text: 'Reservation',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.addbookings);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Reservations()));
              }),
          //Divider(),
          Divider(),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return SizedBox(
      height: 100,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.centerLeft,
            fit: BoxFit.contain,
            image: AssetImage('assets/Taxi-Planner-Logo.png'),
          ),
        ),
        child: null,
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue[200],
            size: 27.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
