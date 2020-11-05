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
  var _currencies = ["Rupees", "Dollars", "Pound Sterling"];
  final _minimumpadding = 5.0;
  String _date_picker_text = "";

  TextEditingController principalcontroller = TextEditingController();
  TextEditingController receiptnocontroller = TextEditingController();
  TextEditingController termcontroller = TextEditingController();
  TextEditingController detailscontroller = TextEditingController();
  TextEditingController _mydatecontroller;

  var _currentitemsel = "";

  void initState() {
    super.initState();
    _currentitemsel = _currencies[0];
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
                Icon(Icons.book_rounded, size: 100, color: Colors.blue),
                // Padding(
                //     padding: EdgeInsets.only(
                //         top: _minimumpadding, bottom: _minimumpadding),
                //     child: TextFormField(
                //         keyboardType: TextInputType.number,
                //         style: textStyle,
                //         controller: principalcontroller,
                //         validator: (String value) {
                //           Pattern pat = r'^[0-9]';
                //           RegExp regex = new RegExp(pat);

                //           if (value.isEmpty) {
                //             return "Principal required*";
                //           } else if (!(regex.hasMatch(value))) {
                //             return "Number have to be input";
                //           }
                //         },
                //         decoration: InputDecoration(
                //             labelText: 'Principal',
                //             hintText: 'Enter Principal',
                //             labelStyle: textStyle,
                //             errorStyle: TextStyle(
                //               color: Colors.yellowAccent,
                //               fontSize: 15.0,
                //             ),
                //             errorBorder: new OutlineInputBorder(
                //                 borderSide:
                //                     new BorderSide(color: Colors.yellow)),
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(5.0))))),
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
                            return "No of Receipt Required*";
                          } else if (!(regex.hasMatch(value))) {
                            return "Number have to be input";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'No Of Receipt',
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
                        controller: detailscontroller,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Details Required*";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Details',
                            hintText: 'Details about the book',
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
                          controller: termcontroller,
                          decoration: InputDecoration(
                              labelText: 'Sale',
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
                        // Container(
                        //   width: _minimumpadding * 5,
                        // ),
                        // Expanded(
                        //     child: DropdownButton<String>(
                        //   items: _currencies.map((String value) {
                        //     return DropdownMenuItem<String>(
                        //       value: value,
                        //       child: Text(value),
                        //     );
                        //   }).toList(),
                        //   value: _currentitemsel,
                        //   style: textStyle,
                        //   onChanged: (String newvalsel) {
                        //     _ondropdownitemsel(newvalsel);
                        //   },
                        // )),
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
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  this.displayresult = _calculatetotal();
                                }
                              });
                            },
                          ),
                        ),
                        Container(
                          width: _minimumpadding * 5,
                        ),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
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

  Widget getImage() {
    AssetImage assetimage = AssetImage('images/money.png');
    Image image = Image(
      image: assetimage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumpadding * 10),
    );
  }

  void _ondropdownitemsel(String newvalsel) {
    setState(() {
      this._currentitemsel = newvalsel;
    });
  }

  String _calculatetotal() {
    double principal = double.parse(principalcontroller.text),
        receiptno = double.parse(receiptnocontroller.text),
        term = double.parse(termcontroller.text);
    double total = principal + (principal * receiptno * term) / 100;
    String result =
        'After $term years, your investment will be worth $total $_currentitemsel';
    return result;
  }

  void _reset() {
    principalcontroller.clear();
    receiptnocontroller.clear();
    termcontroller.clear();
    displayresult = "";
    detailscontroller.clear();
    _currentitemsel = _currencies[0];
    _mydatecontroller.clear();
    _date_picker_text = "";
  }
}
