import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  ViewDetails({Key key}) : super(key: key);

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Details'),
        ),
        body: Center(child: Text('view details to be implemented')));
  }
}
