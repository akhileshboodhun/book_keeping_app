import 'package:book_keeping_app/views/reservations.dart';
import 'package:book_keeping_app/views/viewdetails.dart';
import 'package:book_keeping_app/widgets/mydrawer.dart';
import 'package:book_keeping_app/widgets/mytile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'bookkeeping.dart';
import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(3, 3),
    const StaggeredTile.count(3, 3),
  ];

  List<Widget> _tiles = <Widget>[
    MyTile(
      Colors.lightBlue,
      LineAwesomeIcons.book,
      'New Entry',
      viewComponent: BookKeepingForm(),
    ),
    MyTile(
      Colors.amber,
      LineAwesomeIcons.info,
      'All Details',
      viewComponent: ViewDetails(),
    ),
    MyTile(
      Colors.brown,
      LineAwesomeIcons.pie_chart,
      'Dashboard',
      viewComponent: DashboardGenerator(),
    ),
    MyTile(
      Colors.deepOrange,
      LineAwesomeIcons.calendar,
      'Reservations',
      viewComponent: Reservations(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Bookkeeping App'),
        ),
        body: new StaggeredGridView.count(
          shrinkWrap: false,
          crossAxisCount: 6,
          staggeredTiles: _staggeredTiles,
          children: _tiles,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
        )

        // body: Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: <Widget>[
        //       Text(
        //         'INSERT LOGO FIH',
        //         style: TextStyle(fontSize: 15),
        //       ),
        //       RaisedButton(
        //           child: Text("Cash Out Book"),
        //           onPressed: () {
        //             // Navigator.of(context)
        //             //     .pushNamed('/second', arguments: 'Hello there');
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => BookKeepingForm()));
        //           }),
        //       RaisedButton(
        //           child: Text("All Details"),
        //           onPressed: () {
        //             Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => ViewDetails()));
        //           }),
        //       RaisedButton(
        //           child: Text("Dashboard"),
        //           onPressed: () {
        //             Navigator.push(context,
        //                 MaterialPageRoute(builder: (context) => Dashboard()));
        //           }),
        //       RaisedButton(
        //           child: Text("Reservation"),
        //           onPressed: () {
        //             Navigator.of(context)
        //                 .pushNamed('/second', arguments: 'Hello there');
        //           })
        //     ],
        //   ),
        // ),
        );
  }
}
