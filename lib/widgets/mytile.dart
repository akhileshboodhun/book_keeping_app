import 'package:flutter/material.dart';

class MyTile extends StatefulWidget {
  MyTile(this.backgroundColor, this.iconData, this.label, {this.viewComponent});

  final Color backgroundColor;
  final IconData iconData;
  String label;
  Widget viewComponent;

  @override
  _MyTileState createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.grey[300], width: 1)),
      color: Colors.white,
      child: new InkWell(
        onTap: () {
          setState(() {
            if (this.widget.viewComponent != null) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          this.widget.viewComponent));
            }
          });
        },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  widget.iconData,
                  color: Colors.grey[600],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                    child: Text(
                      this.widget.label,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
