import 'dart:convert';

import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/services/cashbook_service.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class BookKeepingForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _BookKeepingFormState();
  }
}

class _BookKeepingFormState extends State<BookKeepingForm> {
  var _formKey = GlobalKey<FormState>();
  final _minimumpadding = 5.0;
  String _date_picker_text = "";
  DateTime selectedDate = DateTime.now();

  TextEditingController principalcontroller = TextEditingController();
  TextEditingController receiptnocontroller = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController _mydatecontroller;

  void initState() {
    super.initState();
    _mydatecontroller = new TextEditingController();
  }

  var displayresult = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumpadding * 2),
            // margin: EdgeInsets.all(_minimumpadding * 2),
            child: ListView(
              children: <Widget>[
                Icon(LineAwesomeIcons.book, size: 100, color: Colors.blue),
                Padding(
                  padding: EdgeInsets.only(
                      top: _minimumpadding, bottom: _minimumpadding),
                  child: TextFormField(
                    controller: _mydatecontroller,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      hintText: 'Select Date',
                      labelStyle: textStyle,
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      errorBorder: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.yellow)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                onCancel: () {
                                  setState(() {
                                    // _add_btn_disable = true;
                                  });
                                },
                                theme: DatePickerTheme(
                                  containerHeight: 210.0,
                                ),
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime.now().add(Duration(days: 60)),
                                onConfirm: (date) {
                                  setState(() {});
                                  selectedDate = date;
                                  _date_picker_text =
                                      '${date.day}-${date.month}-${date.year}';
                                  // _add_btn_disable = false;
                                  print(_date_picker_text);
                                  _mydatecontroller.text = _date_picker_text;
                                  setState(() {});
                                },
                                //https://stackoverflow.com/questions/55702224/how-to-remove-time-stamp-or-get-only-date-form-datepicker-in-flutter-default-dat
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          }),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: receiptnocontroller,
                        validator: (String value) {
                          Pattern pat = r'^[0-9]';
                          RegExp regex = new RegExp(pat);

                          if (value.isEmpty) {
                            return "Receipt No. Required*";
                          } else if (!(regex.hasMatch(value))) {
                            return "Number have to be input";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Receipt No',
                            hintText: 'Numerics',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                            errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))))),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: textStyle,
                        controller: descriptioncontroller,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Details Required*";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Details about the books',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15.0,
                            ),
                            errorBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.red)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))))),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            Pattern pat = r'^[0-9]';
                            RegExp regex = new RegExp(pat);

                            if (value.isEmpty) {
                              return "Sale Required*";
                            } else if (!(regex.hasMatch(value))) {
                              return "Number only";
                            }
                            // if(value.isEmpty){
                            //   return "Enter year properly";
                            // }
                          },
                          style: textStyle,
                          controller: quantityController,
                          decoration: InputDecoration(
                              labelText: 'Quantity',
                              hintText: 'Numerics',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              errorBorder: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.red)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String value) {
                            Pattern pat = r'^[0-9]';
                            RegExp regex = new RegExp(pat);

                            if (value.isEmpty) {
                              return "Sale Required*";
                            } else if (!(regex.hasMatch(value))) {
                              return "Number only";
                            }
                            // if(value.isEmpty){
                            //   return "Enter year properly";
                            // }
                          },
                          style: textStyle,
                          controller: amountController,
                          decoration: InputDecoration(
                              labelText: 'Amount',
                              hintText: 'Numerics',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              errorBorder: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.red)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumpadding, bottom: _minimumpadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Colors.white,
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () async {
                              var buffer = new Cashbook(
                                  receipt_no:
                                      int.parse(receiptnocontroller.text),
                                  description: descriptioncontroller.text,
                                  quantity: int.parse(quantityController.text),
                                  amount: int.parse(amountController.text),
                                  date: selectedDate);

                              print(json.encode(buffer.toJson()));
                              postCashbook(buffer).then((value) =>
                                  print('status=' + value.toString()));
                              setState(() {});
                            },
                          ),
                        ),
                        Container(
                          width: _minimumpadding * 5,
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Colors.white,
                            child: Text(
                              'Reset',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumpadding * 2),
                  child: Text(
                    this.displayresult,
                    style: textStyle,
                  ),
                )
              ],
            ),
          )),
    );
  }

  void _reset() {
    principalcontroller.clear();
    receiptnocontroller.clear();
    quantityController.clear();
    amountController.clear();
    displayresult = "";
    descriptioncontroller.clear();
    _mydatecontroller.clear();
    _date_picker_text = "";
  }
}
