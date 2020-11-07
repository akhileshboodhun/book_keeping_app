import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/services/cashbook_service.dart';
import 'package:book_keeping_app/widgets/cashbook_details_pdt.dart';
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
        body: Container(
          child: FutureBuilder<List<Cashbook>>(
              future: fetchCashbooks(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('future buiulder error');
                  print(snapshot.error);
                }
                if (snapshot.hasData) {
                  if (snapshot.data.length > 0) {
                    return MyPaginatedDT(mylist: snapshot.data);
                  }
                }
                // if (snapshot.data != null) {
                //   return Center(child: Text("Data Received"));
                // }
                // ? MyPaginatedDT(mylist: snapshot.data)
                // else
                return Center(child: CircularProgressIndicator());
                // Center(child: Text("Wow!. Such Empty."));
              }),
        ));
  }
}
