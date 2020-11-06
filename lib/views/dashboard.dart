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
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Total Sale',
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
                            child: Text("37%",
                                style: TextStyle(
                                    color: Colors.blueAccent[200],
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(100.0),
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
                        title: 'Book Sold = ',
                        icon: Icons.book_outlined,
                        color: 0xffFED525),
                    Item(
                        title: 'Reservation made = ',
                        icon: Icons.star,
                        color: 0xffFD637B),
                    Item(
                        title: 'Incomes = ',
                        icon: Icons.monetization_on,
                        color: 0xff21CDFF),
                    Item(
                        title: 'Sales = ',
                        icon: Icons.show_chart,
                        color: 0xff7585F6)
                  ],
                ),
              ])),
        ));
  }
}
