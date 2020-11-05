import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String data;

  Dashboard({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
