import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String data;

  SecondPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Second Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              widget.data,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
