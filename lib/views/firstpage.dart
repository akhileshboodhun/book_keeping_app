import 'package:book_keeping_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'bookkeeping.dart';
import 'secondpage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Bookkeeping App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'INSERT LOGO FIH',
              style: TextStyle(fontSize: 15),
            ),
            RaisedButton(
                child: Text("Cash Out Book"),
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamed('/second', arguments: 'Hello there');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SIForm()));
                }),
            RaisedButton(
                child: Text("All Details"),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/second', arguments: 'Hello there');
                }),
            RaisedButton(
                child: Text("Dashboard"),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/second', arguments: 'Hello there');
                }),
            RaisedButton(
                child: Text("Reservation"),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/second', arguments: 'Hello there');
                })
          ],
        ),
      ),
    );
  }
}
