// import 'package:flutter_spleshscreen/Constant/Constant.dart';
import 'package:book_keeping_app/widgets/mydrawer.dart';
import 'package:book_keeping_app/widgets/mytile.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 2),
  ];

  List<Widget> _tiles = <Widget>[
    MyTile(
      Colors.green,
      FlatIcons.calendar_2,
      'Schedule Food',
      viewComponent: null,
    ),
    MyTile(Colors.lightBlue, FlatIcons.add_3, 'Add Order'),
    MyTile(Colors.amber, FlatIcons.add_3, 'Add Food'),
    MyTile(Colors.brown, FlatIcons.edit, 'Manage Orders'),
    MyTile(Colors.deepOrange, FlatIcons.bookmark, 'Special Requests'),
    MyTile(Colors.indigo, Icons.fastfood, 'Manage Food'),
    MyTile(Colors.red, FlatIcons.user_3, 'Manage Profile'),
    MyTile(Colors.red, FlatIcons.list, 'Daily Orders'),
    MyTile(Colors.red, FlatIcons.list_1, 'All Orders'),
    MyTile(
      Colors.pink,
      FlatIcons.exit_2,
      'Logout',
      viewComponent: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
        /* appBar: AppBar(
          title: new Text("Home Page"),
        ),*/
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              children: <Widget>[
                SizedBox(height: 70.0),
                SizedBox(
                  height: 0.0,
                  child: new Text(
                    "Home Page",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                    elevation: 0.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('');
                    },
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // new Image.asset(
                        //   'assets/images/video.png',
                        //   height: 40.0,
                        //   width: 40.0,
                        // ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: new Text(
                              "Add Entry",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.blueAccent),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                  child: new RaisedButton(
                      elevation: 0.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      padding: EdgeInsets.only(
                          top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('');
                      },
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // new Image.asset('assets/images/image.png',
                          //     height: 40.0, width: 40.0),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "View All",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                      ),
                      textColor: Color(0xFF292929),
                      color: Colors.blueAccent),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0, right: 0.0, top: 30.0, bottom: 0.0),
                  child: new RaisedButton(
                      elevation: 0.0,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      padding: EdgeInsets.only(
                          top: 7.0, bottom: 7.0, right: 25.0, left: 7.0),
                      onPressed: () async {
                        Navigator.of(context).pushReplacementNamed('');
                      },
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // new Image.asset(
                          //   'assets/images/animation.png',
                          //   height: 40.0,
                          //   width: 40.0,
                          // ),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: new Text(
                                "Dashboard",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ))
                        ],
                      ),
                      textColor: Color(0xFF292929),
                      color: Colors.blueAccent),
                )
              ],
            )
          ],
        ));
  }
}
