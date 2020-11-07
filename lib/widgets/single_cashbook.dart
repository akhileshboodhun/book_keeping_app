import 'dart:convert';

import 'package:book_keeping_app/models/cashbook_model.dart';
import 'package:book_keeping_app/services/cashbook_service.dart';
import 'package:book_keeping_app/utils/dateformatter.dart';
import 'package:book_keeping_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SingleCashbookPage extends StatefulWidget {
  SingleCashbookPage({Key key, this.cb}) : super(key: key);
  final Cashbook cb;
  @override
  _SingleCashbookPageState createState() => _SingleCashbookPageState();
}

class _SingleCashbookPageState extends State<SingleCashbookPage> {
  var _formKey = GlobalKey<FormState>();
  final _minimumpadding = 5.0;
  String _date_picker_text = "";
  DateTime selectedDate = DateTime.now();
  TextEditingController receiptnocontroller;
  TextEditingController quantityController;
  TextEditingController amountController;

  TextEditingController descriptioncontroller;
  TextEditingController _mydatecontroller;
  bool checkBoxValue;

  void initState() {
    super.initState();
    receiptnocontroller =
        TextEditingController(text: "${widget.cb.receipt_no}");
    quantityController = TextEditingController(text: "${widget.cb.quantity}");
    descriptioncontroller =
        TextEditingController(text: "${widget.cb.description}");
    amountController = TextEditingController(text: "${widget.cb.amount}");
    selectedDate = widget.cb.date;
    _date_picker_text =
        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
    // _add_btn_disable = false;
    print(_date_picker_text);
    _mydatecontroller = new TextEditingController(text: _date_picker_text);
    checkBoxValue = widget.cb.isReserved;
  }

  var displayresult = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Edit Cash Out Book Entry"),
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
                        enabled: false,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.grey[800]),
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
                            fillColor: Colors.grey[200],
                            filled: true,
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
                    child: Row(children: <Widget>[
                      Text('Is Reserved?', style: textStyle),
                      Checkbox(
                          value: checkBoxValue,
                          activeColor: Colors.green,
                          onChanged: (bool newValue) {
                            setState(() {
                              checkBoxValue = newValue;
                            });
                          }),
                    ])),
                Container(
                  width: _minimumpadding * 5,
                ),
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
                                  date: selectedDate,
                                  isReserved: checkBoxValue);

                              print(json.encode(buffer.toJson()));
                              updateCashbook(widget.cb.receipt_no, buffer).then(
                                  (value) =>
                                      print('status=' + value.toString()));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeScreen()));
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
                        ),
                        Container(
                          width: _minimumpadding * 5,
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            child: Text(
                              'Delete',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                deleteCashbook(widget.cb.receipt_no)
                                    .then((value) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              HomeScreen()));
                                });
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
    receiptnocontroller.text = "${widget.cb.receipt_no}";
    quantityController.text = "${widget.cb.quantity}";
    amountController.text = "${widget.cb.amount}";
    displayresult = "";
    descriptioncontroller.text = "${widget.cb.description}";
    selectedDate = widget.cb.date;
    _date_picker_text =
        '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
    // _add_btn_disable = false;
    print(_date_picker_text);
    _mydatecontroller.text = _date_picker_text;
    checkBoxValue = false;
  }
}
