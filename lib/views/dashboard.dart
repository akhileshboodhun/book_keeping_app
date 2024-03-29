import 'package:book_keeping_app/models/dashboard_model.dart';
import 'package:book_keeping_app/services/cashbook_service.dart';
import 'package:book_keeping_app/services/dashboard_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'item.dart';

class DashboardGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff333), // status bar color
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                child: FutureBuilder<Dashboard>(
                    future: getDashboard(),
                    builder: (context, snapshot) => (snapshot.hasData)
                        ? Column(children: [
                            TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Total Sales',
                              ),
                            ),
                            // Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       IconButton(
                            //           onPressed: () {},
                            //           icon: Icon(Icons.sort, size: 30, color: Colors.grey)),
                            //       CircleAvatar(
                            //           radius: 20,
                            //           backgroundImage: NetworkImage(
                            //               'https://images-na.ssl-images-amazon.com/images/M/MV5BOTIxNTE2NTQ3Nl5BMl5BanBnXkFtZTcwMzMwOTk2Nw@@._V1_UX172_CR0,0,172,256_AL_.jpg'))
                            //     ]),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Text(
                                            "${snapshot.data.totalsales}",
                                            style: TextStyle(
                                                color: Colors.blueAccent[200],
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                        decoration: new BoxDecoration(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0),
                                            border: Border.all(
                                                color: Color(0xff7E89FC),
                                                style: BorderStyle.solid,
                                                width: 25),
                                            color: Colors.transparent),
                                      ),
                                    ]),
                                flex: 1),
                            Wrap(
                              spacing: 17,
                              runSpacing: 17,
                              children: [
                                Item(
                                    title:
                                        'Book Sold = ${snapshot.data.booksold}',
                                    icon: Icons.book_outlined,
                                    color: Colors.amber),
                                Item(
                                    title:
                                        'Reservation made = ${snapshot.data.reservations}',
                                    icon: Icons.star,
                                    color: Colors.pink[400]),
                                Item(
                                    title: 'Incomes = ${snapshot.data.revenue}',
                                    icon: Icons.monetization_on,
                                    color: Colors.blue),
                                Item(
                                    title:
                                        'Sales = ${snapshot.data.totalsales}',
                                    icon: Icons.show_chart,
                                    color: Colors.grey)
                              ],
                            ),
                          ])
                        : Center(child: CircularProgressIndicator())))));
  }
}
