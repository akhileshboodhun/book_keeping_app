import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/services/cashbook_service.dart';
import 'package:book_keeping_app/widgets/cashbook_details_pdt.dart';
import 'package:flutter/material.dart';

class Reservations extends StatefulWidget {
  Reservations({Key key}) : super(key: key);

  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reservations'),
        ),
        body: Container(
          child: FutureBuilder<List<Cashbook>>(
              future: fetchCashbooks(choice: 1),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('future buiulder error');
                  print(snapshot.error);
                  // return Center(child: Text("Wow!. Such Empty."));
                }
                if (snapshot.hasData) {
                  if (snapshot.data.length > 0) {
                    return MyPaginatedDT(mylist: snapshot.data);
                  }
                }
                return Center(child: CircularProgressIndicator());
              }),
        ));
  }
}
