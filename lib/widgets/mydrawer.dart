import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String role = '';
  String name = '';
  SharedPreferences prefs;
  getPref() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString('role');
      name = prefs.getString('name');
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name + ' (' + role + ')',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Divider(),
          if (role != 'employee' &&
              role != 'approver' &&
              role != 'delegated_approver')
            _createDrawerItem(
                icon: LineAwesomeIcons.dashboard,
                text: 'Dashboard',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                }),
          _createDrawerItem(
              icon: LineAwesomeIcons.taxi,
              text: 'My Bookings',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.mybookings);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => null));
              }),
          _createDrawerItem(
              icon: LineAwesomeIcons.calendar,
              text: 'Add My Bookings',
              onTap: () {
                Navigator.pop(context);
                //Navigator.pushNamed(context, Routes.addbookings);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) => null));
              }),
          //Divider(),
          if (role == 'superadmin' ||
              role == 'approver' ||
              role == 'delegated_approver')
            _createDrawerItem(
                icon: LineAwesomeIcons.plus,
                text: 'Add Other Bookings',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                }),
          if (role != 'employee')
            _createDrawerItem(
                icon: LineAwesomeIcons.list,
                text: 'Booking Management',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                }),
          if (role != 'employee' &&
              role != 'approver' &&
              role != 'delegated_approver')
            _createDrawerItem(
                icon: LineAwesomeIcons.user,
                text: 'User List',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                }),
          if (role == 'superadmin' || role == 'approver')
            _createDrawerItem(
                icon: LineAwesomeIcons.share,
                text: 'Delegate Role',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                }),
          Divider(),
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                  // await LogoutService.logout();
                },
              ),
            ],
          ),
          ListTile(
            title: Text(
              'Powered by SD Worx Interns',
              style: TextStyle(color: Colors.grey),
            ),
          ),
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
            color: Colors.orangeAccent[200],
            size: 27.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
